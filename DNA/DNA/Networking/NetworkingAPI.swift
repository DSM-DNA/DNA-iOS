//
//  Networking.swift
//  DNA
//
//  Created by 장서영 on 2021/02/21.
//

import Foundation
import Alamofire

enum NetworkingAPI{
    case ConfirmEmail(_ isCorrect: Bool)
    case SignUp(_ name: String, _ email: String, _ password: String)
    case Login(_ email: String, _ password: String)
    case CommentList(_ size: Int, _ page: Int)
    case CommentWr(_ timelineId: Int, _ content: String)
}
