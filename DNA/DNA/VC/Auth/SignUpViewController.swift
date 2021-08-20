//
//  SignUpViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import UIKit
import Alamofire

final class SignUpViewController: UIViewController {

    @IBOutlet weak private var circle: UIView!
    @IBOutlet weak private var nameTxt: UITextField!
    @IBOutlet weak private var emailTxt: UITextField!
    @IBOutlet weak private var sendEmailButton: UIButton!
    @IBOutlet weak private var warningLabel: UILabel!
    @IBOutlet weak private var confirmNumTxt: UITextField!
    @IBOutlet weak private var confirmNumButton: UIButton!
    @IBOutlet weak private var pwTxt: UITextField!{
        didSet {
            pwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak private var confirmPwTxt: UITextField!{
        didSet {
            confirmPwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak private var signUpButton: UIButton!
    
    private let id = String()
    private var isConfirmed : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        emailTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        nameTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        confirmNumTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        confirmPwTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        pwTxt.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction private func sendEmailButton(_ sender: UIButton){
        HTTPClient().post(url: AuthAPI.sendEmail.path(), params: ["email":emailTxt.text!], header: Header.tokenIsEmpty.header()).responseJSON(completionHandler: {
            [unowned self] response in
            switch response.response?.statusCode {
            case 201 :
                print("SUCCESS")
                showAlert(title: "인증번호가 메일로 전송되었습니다.", message: nil, action: nil, actionTitle: "확인")
            case 400:
                print("BAD REQUEST")
                showAlert(title: "인증번호 전송에 실패했습니다.", message: nil, action: nil, actionTitle: "확인")
            default : print(response.error ?? 0)
                errorAlert()
            }
        })
    }
    
    @IBAction private func confirmNumButton(_ sender: UIButton){
        HTTPClient().patch(url: AuthAPI.confirmNum.path(), params: ["email":"\(emailTxt.text!)", "verifyCode":"\(confirmNumTxt.text!)"], header: Header.tokenIsEmpty.header()).responseJSON(completionHandler: {
            [unowned self] response in
            switch response.response?.statusCode {
            case 200 :
                print("SUCCESS")
                isConfirmed = true
                showAlert(title: "이메일 인증에 성공하셨습니다.", message: nil, action: nil, actionTitle: "확인")
            case 400:
                print("BAD REQUEST")
                showAlert(title: "인증번호가 잘못되었습니다.", message: "다시 시도해 주십시오.", action: nil, actionTitle: "확인")
                confirmNumTxt.text = ""
            default : print(response.response?.statusCode)
                errorAlert()
            }
        })
    }
    
    @IBAction private func signUpButton(_ sender: UIButton){
        if(nameTxt.text == "" || emailTxt.text == "" || pwTxt.text == "" || confirmNumTxt.text == "" || isConfirmed == false){
            showAlert(title: "회원가입이 불가능합니다.", message: "빈칸이나 인증번호를 다시 한번 확인해 주세요.", action: nil, actionTitle: "확인")
        }
        
        else {
            guard let Name = nameTxt.text else {return}
            guard let Email = emailTxt.text else {return}
            guard let Password = pwTxt.text else {return}
            signUp(name: Name, email: Email, password: Password)
        }
    }
    
    private func signUp(name: String, email: String, password: String){
        HTTPClient().post(url: AuthAPI.signUp.path(), params: ["name":name, "email":email, "password":password], header: Header.tokenIsEmpty.header()).responseJSON(completionHandler: {
            [unowned self] response in
            switch response.response?.statusCode {
            case 201:
                print("SUCCESS")
                navigationController?.popViewController(animated: true)
            case 400:
                warningLabel.isHidden = false
                print("BAD REQUEST")
                errorAlert()
            case 401:
                warningLabel.isHidden = false
                print("UNAUTHORIZED")
                errorAlert()
            case 403:
                warningLabel.isHidden = false
                print("FORBIDDEN")
                errorAlert()
            case 404:
                warningLabel.isHidden = false
                print("NOT FOUND")
                errorAlert()
            case 409:
                warningLabel.isHidden = false
                print("CONFLICT")
                errorAlert()
            default :
                warningLabel.isHidden = false
                print(response.response?.statusCode ?? 0)
                errorAlert()
            }
        })
    }
}
