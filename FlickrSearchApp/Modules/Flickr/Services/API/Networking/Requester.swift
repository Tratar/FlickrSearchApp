//
//  Requester.swift
//  VApp
//
//  Created by Michael Belenchenko on 2/22/17.
//  Copyright © 2017 V Communicate. All rights reserved.
//

import UIKit
import Alamofire

let authTokenKey = "Authorization"

class Requester {
    
    static func request(path: String, method: String, parameters: [String: Any], placeholders: [String: CustomStringConvertible], mapper:((Any) -> Any)?, completion:@escaping (Any?, Error?) -> ()) -> Cancallable {
        let path = PathMaker.makePath(for: path, placeholders: placeholders)
        return Alamofire.request(path, method: self.method(by: method), parameters: parameters).validate(statusCode: 200..<300).validate(contentType: ["application/json"]).responseJSON { (response) in
            let value = response.result.value
            guard response.error == nil && (value is [String: Any] || value is [[String: Any]]) else {
                completion(nil, response.error)
                return
            }
            
            completion(mapper == nil ? value! : mapper!(value!), nil)
        }
    }
    
    static func method(by stringRepresentation: String) -> Alamofire.HTTPMethod {
        switch stringRepresentation {
        case "GET":
            return .get
        case "POST":
            return .post
        case "PUT":
            return .put
        case "DELETE":
            return .delete
        default:
            return .get
        }
    }
}
