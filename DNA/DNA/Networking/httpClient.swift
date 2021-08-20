//
//  HTTPClient.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import Foundation
import Alamofire

protocol HTTPCleintProvider {
    func get(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func put(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func delete(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func patch(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
}

class HTTPClient: HTTPCleintProvider {
    
    let baseURL = "http://211.38.86.92:9191"
    
    func get(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: header,
                          interceptor: nil)
    }
    
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.prettyPrinted,
                          headers: header,
                          interceptor: nil)
    }
    
    func put(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .put,
                          parameters: params,
                          encoding: JSONEncoding.prettyPrinted,
                          headers: header,
                          interceptor: nil)
    }
    
    func delete(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .delete,
                          parameters: params,
                          encoding: JSONEncoding.prettyPrinted,
                          headers: header,
                          interceptor: nil)
    }
    
    func patch(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .patch,
                          parameters: params,
                          encoding: JSONEncoding.prettyPrinted,
                          headers: header,
                          interceptor: nil)
    }
}
