//
//  MenuVC.swift
//  DNA
//
//  Created by 장서영 on 2021/02/11.
//

import UIKit

class MenuVC: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var TButton: UIButton!
    @IBOutlet weak var GButton: UIButton!
    @IBOutlet weak var CButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.layer.cornerRadius = 25
        AButton.layer.cornerRadius = 16
        TButton.layer.cornerRadius = 16
        GButton.layer.cornerRadius = 16
        CButton.layer.cornerRadius = 16
        
        mainView.layer.shadowOpacity = 0.3
        mainView.layer.shadowOffset = CGSize(width: 4, height: 4)
        mainView.layer.shadowRadius = 9
        
        shadow(AButton)
        shadow(TButton)
        shadow(GButton)
        shadow(CButton)
        
    }
    
    func shadow(_ button: UIButton){
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 9
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
