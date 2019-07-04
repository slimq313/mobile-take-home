//
//  Service.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    func dataManagerCall<T: Decodable>(method: HTTPMethod, urlString: String, params: [String : AnyObject]?, headers: [String : String]?, completion: @escaping (T) -> ()) {
        guard let url = URL(string: urlString) else { return }
        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: nil).responseData { (responseObject) in
            if responseObject.response?.statusCode == 200 {
                if responseObject.result.isSuccess {
                    guard let data = responseObject.result.value else { return }
                    do {
                        let object = try JSONDecoder().decode(T.self, from: data)
                        DispatchQueue.main.async {
                            completion(object)
                        }
                    } catch let jsonErr {
                        print("Failed to serialize json:", jsonErr)
                    }
                } else if responseObject.result.isFailure {
                    let error = responseObject.result.error! as NSError
                    print("Request failed with error: \(error.description)")
                }
            } else {
                
            }
        }
    }
}
