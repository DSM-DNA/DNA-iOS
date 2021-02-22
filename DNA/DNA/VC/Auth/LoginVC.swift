//
//  LoginVC.swift
//  DNA
//
//  Created by 장서영 on 2021/02/11.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var pwTxt: UITextField!
    @IBOutlet weak var warningLabel : UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
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
