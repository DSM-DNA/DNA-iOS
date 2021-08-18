//
//  ViewControllerExtension.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import UIKit

extension UIViewController {
    func setNavigationBar(){
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    func shadow(_ button: UIButton){
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 9
    }
    
    func yearMonthFormat(date : String) -> String{
        let componentDate = date.components(separatedBy: [":", "-", ".", "T"])
        
        let formatDate = componentDate[0] + "년" + componentDate[1] + "월"
        
        return formatDate
    }
    
    func dayFormat(date : String) -> String{
        let componentDate = date.components(separatedBy: [":", "-", ".", "T"])
        
        let formatDate = componentDate[3] 
        
        return formatDate
    }
    
    func errorAlert(){
        let alert = UIAlertController(title: "오류가 발생했습니다.", message: "다시 시도해 주세요.", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String?, action: ((UIAlertAction) -> Void)?, actionTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let setAction = UIAlertAction(title: actionTitle, style: .default, handler: action)
        alert.addAction(setAction)
        present(alert, animated: true, completion: nil)
    }
    
    func warningAlert(title: String, message: String?, action:
                        ((UIAlertAction)->Void)?, actionTitle: String, cancelActionTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: cancelActionTitle, style: .cancel, handler: nil)
        let setAction = UIAlertAction(title: actionTitle, style: .destructive, handler: action)
        alert.addAction(cancelAction)
        alert.addAction(setAction)
        present(alert, animated: true, completion: nil)
    }
}

