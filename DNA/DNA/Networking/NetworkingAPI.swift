//
//  Networking.swift
//  DNA
//
//  Created by 장서영 on 2021/02/21.
//

import Foundation
import Alamofire

enum NetworkingAPI{
    case refreshToken
    case ConfirmEmail(_ isCorrect: Bool)
    case SignUp(_ name: String, _ email: String, _ password: String)
    case Login(_ email: String, _ password: String)
    case CommentList(_ size: Int, _ page: Int)
    case CommentWr(_ timelineId: Int, _ content: String)
    
    var path: String {
        switch self {
        case .Login :
            return "/auth"
        case .SignUp :
            return "/signup"
        case .ConfirmEmail :
            return "/email"
        case .CommentList, .CommentWr :
            return "/comment"
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .Login, .SignUp:
            return nil
        case .refreshToken :
            let refreshToken : String = "token"
            let userDefault = UserDefaults.standard
            userDefault.set(refreshToken, forKey: "refresh-Token")
            userDefault.synchronize()
            guard let token = userDefault.string(forKey: "refresh-Token") else {return nil}
            return ["Authorization" : "Bearer" + "token"]
            
        default:
            
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .Login(let email, let password):
            print(["email":email, "password":password])
            return ["email":email, "password":password]
        
        case .SignUp(let name, let email, let password):
            print(["name":name, "email":email, "password":password])
            return ["name":name, "email":email, "password":password]
        default:
            return [:]
        }
    }
}
