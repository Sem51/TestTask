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
//import SwiftyJSON

protocol giphyDelegate {
    
    func updatePictureInfo(picture: Image)
    func failure()
}

enum RequestError: Error {
    case loadFailed
    case jsonFileIsBroken
}

class Request {

    var delegate: giphyDelegate!
    
    let giphyUrl = "http://api.giphy.com/v1/gifs/random"
    let publicBetaApikey = "dc6zaTOxFJmzC"
    let format = "json"
    
    func getRandomImage() {
        let params = ["api_key" : publicBetaApikey, "fmt" : format]
        do {
            try setRequest(params: params as [String : AnyObject]?)
        } catch {
            print("Load faild!")
            self.delegate.failure()
        }
    }
    
    func setRequest(params: [String : AnyObject]?) throws {
        
        
        request(giphyUrl, method: .get, parameters: params).responseJSON { (json) in
            
            if let data = json.data {
                let json = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                print(json!)
                self.parsingJson(json: json)
            }
        }
    }
    
    func parsingJson(json: NSDictionary?) {
        if json == nil {
            self.delegate.failure()
        } else {
            let picture = Image(json: json!)
            self.delegate.updatePictureInfo(picture: picture)
        }
    }
}
