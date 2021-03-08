//
//  httpClient.swift
//  DNA
//
//  Created by 장서영 on 2021/02/21.
//

import Foundation
import Alamofire

protocol HTTPCleintProvider {
    func get(_ api: NetworkingAPI) -> DataRequest
    func post(_ api: NetworkingAPI) -> DataRequest
    func put(_ api: NetworkingAPI) -> DataRequest
    func delete(_ api: NetworkingAPI) -> DataRequest
}

class HTTPClient: HTTPCleintProvider {
    let baseURL = "http://211.38.86.92:8080"
    
    func get(_ api: NetworkingAPI) -> DataRequest {
        return AF.request(baseURL + api.path, method: .get, parameters: api.parameters, encoding: URLEncoding.default, headers: api.headers, interceptor: nil)
    }
    
    func post(_ api: NetworkingAPI) -> DataRequest {
        return AF.request(baseURL + api.path, method: .post, parameters: api.parameters, encoding:JSONEncoding.prettyPrinted, headers: api.headers, interceptor: nil)
    }
    
    func put(_ api: NetworkingAPI) -> DataRequest {
        return AF.request(baseURL + api.path, method: .put, parameters: api.parameters, encoding: JSONEncoding.prettyPrinted, headers: api.headers, interceptor: nil)
    }
    
    func delete(_ api: NetworkingAPI) -> DataRequest {
        return AF.request(baseURL + api.path, method: .delete, parameters: api.parameters, encoding: JSONEncoding.prettyPrinted, headers: api.headers, interceptor: nil)
    }
    
    
}
