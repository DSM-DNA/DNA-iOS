//
//  LoginVC.swift
//  DNA
//
//  Created by 장서영 on 2021/02/11.
//

import UIKit
import Alamofire

var signInModel = [SignInModel]()

class LoginVC: UIViewController {
    
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var pwTxt: UITextField!{
        didSet{
            pwTxt.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var warningLabel : UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    let httpClient = HTTPClient()
    
    private var signInmodel: SignInModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circle.layer.cornerRadius = 0.5 * circle.bounds.size.width
        emailTxt.layer.cornerRadius = 22
        pwTxt.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 22
        warningLabel.isHidden = true
    }
    
    @IBAction func signInButton(_ sender: UIButton!){
        SignIn(email: emailTxt.text!, password: pwTxt.text!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func SignIn(email: String, password: String){
        httpClient.post(.Login(email, password)).responseJSON(completionHandler: {(response) in
            switch response.response?.statusCode {
            case 201:
                print("로그인 성공")
                guard let data = response.data else {return}
                guard let model = try? JSONDecoder().decode(SignInModel.self, from: data) else {return}
                self.signInmodel = model
                guard let pushVC = self.storyboard?.instantiateViewController(identifier: "MenuVC") as? MenuVC else {return}
                self.navigationController?.pushViewController(pushVC, animated: true)
            case 400:
                print("BAD REQUEST")
            case 401:
                print("UNAUTHORIZED")
            case 403:
                print("FORBIDDEN")
            case 404:
                print("NOT FOUND")
            case 409:
                print("CONFLICT")
            default :
                self.warningLabel.isHidden = false
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
