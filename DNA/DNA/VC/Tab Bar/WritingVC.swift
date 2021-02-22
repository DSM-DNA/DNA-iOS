//
//  WritingVC.swift
//  DNA
//
//  Created by 장서영 on 2021/02/11.
//

import UIKit
import DropDown

class WritingVC: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var SetCategoryButton: UIButton!
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var detailTxt: UITextView!
    @IBOutlet weak var registButton: UIButton!
    @IBOutlet weak var backregist: UIView!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backgroundView.layer.cornerRadius = 22
        registButton.layer.cornerRadius = 16
        backregist.layer.cornerRadius = 16
    }
    
    @IBAction func setCategoryButton(_ sender: UIButton){
        dropDown.dataSource = ["T - 대리구매자 구하기", "G - 잠수탄 친구 찾기", "C - 일반 대화 하기", "A - 노동자 구하기"]
        dropDown.anchorView = sender
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        dropDown.cellHeight = 28
        dropDown.textFont = UIFont.systemFont(ofSize: 14)
        dropDown.show()
       
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            SetCategoryButton.setTitle(item, for: .normal)
        }
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
