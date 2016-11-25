//
//  RequestService.swift
//  TestTaskGiphyPictures
//
//  Created by Семен Осипов on 23.11.16.
//  Copyright © 2016 Семен Осипов. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import UIKit

//import SwiftyJSON  - not working in Swift 3.0.1 ;(

enum RequestError: Error {
    case loadFailed
    case jsonFileIsBroken
}

class Request {

    typealias success = (_ image: Image) -> ()
    typealias failure = (_ error: String) -> ()

    var image: Image!
    
    let giphyUrl = "http://api.giphy.com/v1/gifs/random"
    let publicBetaApikey = "dc6zaTOxFJmzC"
    let format = "json"
    
    func getRandomImage(success: @escaping success, failure: @escaping failure) {
        
        let params = ["api_key" : publicBetaApikey, "fmt" : format]
        
        request(giphyUrl, method: .get, parameters: params).responseJSON { response in
            if let data = response.data {
                print(data)
                let json = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                if let jsonDictionary = json {
                    print(jsonDictionary)
                    if let image = Image(json: jsonDictionary) {
                        success(image)
                    }
                } else {
                    failure("Load Failed")
                }
            }
        }
        
    }
}
