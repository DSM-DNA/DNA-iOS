//
//  ViewController.swift
//  DNA
//
//  Created by 장서영 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpBUtton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signInButton.layer.cornerRadius = 22
        signUpBUtton.layer.cornerRadius = 22
    }
    


}

