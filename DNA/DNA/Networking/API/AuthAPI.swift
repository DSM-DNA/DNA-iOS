//
//  AuthAPI.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import Foundation

enum AuthAPI : API {
    case sendEmail
    case confirmNum
    case refreshToken
    case signUp
    case Login
    case Logout
    
    func path() -> String {
        switch self {
        case .sendEmail, .confirmNum :
            return "/email"
        case .Login, .refreshToken :
            return "/auth"
        case .Logout:
            return "/logout"
        case .signUp :
            return "/signup"
        }
    }
}
