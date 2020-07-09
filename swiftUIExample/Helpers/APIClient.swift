//
//  APIClient.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    
    private static let BASE_URL = "https://myfarmapplication.com/"
    private static let API_URL = BASE_URL + "api/v1/"
    
    class func sendRequestWith(path: String, method: HTTPMethod, params: [String: String]?, encoder: ParameterEncoder, headers: HTTPHeaders?, completion: @escaping (Data) -> Void, errorHandler: @escaping (AFError?, JSON?, Int) -> Void) -> DataRequest {
        
        return sendRequestToAPI(path: API_URL + path, method: method, params: params, encoder: encoder, headers: headers, completion: completion, errorHandler: errorHandler)
    }
    
    class func sendRequestToAPI(path: String, method: HTTPMethod, params: [String: String]?, encoder: ParameterEncoder, headers: HTTPHeaders?, completion: @escaping (Data) -> Void, errorHandler: @escaping (AFError?, JSON?, Int) -> Void) -> DataRequest {
        return AF.request(path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? path, method: method, parameters: params, encoder: encoder, headers: headers).responseData { (response) in
                        
            switch response.result {
            case .success(let data):
                if let json = try? JSON(data: data), let code = response.response?.statusCode {
                    
                    print("JSON response: \(json)\n statusCode: \(code)")
                    
                    let statusCode = Enums.StatusCode(rawValue: code)
                    
                    switch statusCode {
                    case .CODE_OK, .CREATED_OK, .NO_CONTENT:
                        completion(data)
                    default:
                        errorHandler(nil, json, code)
                    }
                }
                else {
                    if let code = response.response?.statusCode {
                        errorHandler(nil, nil, code)
                    }
                    else {
                        errorHandler(nil, nil, 0)
                    }
                }
            case .failure(let error):
                errorHandler(error, nil, 0)
            }
        }
    }
}
