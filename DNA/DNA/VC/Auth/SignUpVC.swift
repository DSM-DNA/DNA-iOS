//
//  SignUpVC.swift
//  DNA
//
//  Created by 장서영 on 2021/02/11.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var confirmEmailButton: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var pwTxt: UITextField!
    @IBOutlet weak var confirmPwTxt: UITextField!
    @IBOutlet weak var signUpButton: UIButton!

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
    }
    
    @IBAction func confirmEmailButton(_ sender: UIButton){
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton){
        
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
