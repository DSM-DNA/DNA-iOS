//
//  SignUpVC.swift
//  DNA
//
//  Created by 장서영 on 2021/02/11.
//

import UIKit

var ConfirmEmail : String = ""

class SignUpVC: UIViewController {
    
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var confirmEmailButton: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var pwTxt: UITextField!{
        didSet {
            pwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var confirmPwTxt: UITextField!{
        didSet {
            confirmPwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var signUpButton: UIButton!
    
    
    let httpclient = HTTPClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circle.layer.cornerRadius = 0.5 * circle.bounds.size.width
        nameTxt.layer.cornerRadius = 22
        emailTxt.layer.cornerRadius = 22
        confirmEmailButton.layer.cornerRadius = 12
        pwTxt.layer.cornerRadius = 22
        confirmPwTxt.layer.cornerRadius = 22
        signUpButton.layer.cornerRadius = 22
        warningLabel.isHidden = true
        self.reloadInputViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func confirmEmailButton(_ sender: UIButton){
        ConfirmEmail = emailTxt.text!
        print("tapped")
        httpclient.get(.email).responseJSON(completionHandler: {
            response in
            switch response.response?.statusCode {
            case 200 :
                print("SUCCESS")
                self.confirmEmailButton.setTitle("확인완료", for: .normal)
            case 400: print("BAD REQUEST")
                self.confirmEmailButton.setTitle("확인불가", for: .normal)
            default : print(response.error)
            }
        })
    }
    
    @IBAction func signUpButton(_ sender: UIButton){
        guard let Name = nameTxt.text else {return}
        guard let Email = emailTxt.text else {return}
        guard let Password = pwTxt.text else {return}
        SignUp(name: Name, email: Email, password: Password)
    }
    
    func SignUp(name: String, email: String, password: String){
        httpclient.post(.SignUp(name, email, password)).responseJSON(completionHandler: {
            response in
            switch response.response?.statusCode {
            case 201:
                print("SUCCESS")
                self.navigationController?.popViewController(animated: true)
            case 400:
                self.warningLabel.isHidden = false
                print("BAD REQUEST")
            case 401:
                self.warningLabel.isHidden = false
                print("UNAUTHORIZED")
            case 403:
                self.warningLabel.isHidden = false
                print("FORBIDDEN")
            case 404:
                self.warningLabel.isHidden = false
                print("NOT FOUND")
            case 409:
                self.warningLabel.isHidden = false
                print("CONFLICT")
            default :
                print(response.response?.statusCode)
            }
        })
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
