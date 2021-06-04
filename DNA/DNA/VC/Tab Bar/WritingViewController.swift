//
//  WritingVC.swift
//  DNA
//
//  Created by 장서영 on 2021/02/11.
//

import UIKit
import DropDown

class WritingViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var SetCategoryButton: UIButton!
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var detailTxt: UITextView!
    @IBOutlet weak var registButton: UIButton!
    @IBOutlet weak var backregist: UIView!
    
    let httpClient = HTTPClient()
    var selectedItem = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func setCategoryButton(_ sender: UIButton){
        let dropDown = DropDown()
        dropDown.dataSource = ["T - 대리구매자 구하기", "G - 잠수탄 친구 찾기", "C - 일반 대화 하기", "A - 노동자 구하기"]
        dropDown.anchorView = sender
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        dropDown.cellHeight = 28
        dropDown.textFont = UIFont.systemFont(ofSize: 14)
        dropDown.show()
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            SetCategoryButton.setTitle("\(item)", for: .normal)
            selectedItem = item
        }
    }
    
    func createPost() {
        httpClient.post(.timeLineWr(titleTxt.text!, detailTxt.text, selectedItem)).responseJSON{(response) in
            switch response.response?.statusCode {
            case 201 : print("CREATED")
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
            default :                                   print(response.response?.statusCode)
            }
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