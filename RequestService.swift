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
//import SwiftyJSON  - not working in Swift 3.0.1 ;(

protocol requestDelegate {
    
    func updatePictureInfo(image: Image?) throws
    func failure()
}

enum RequestError: Error {
    case loadFailed
    case jsonFileIsBroken
}

class Request {
    
//    var delegate: requestDelegate!
//    
//    var image: Image!
//    
//    let giphyUrl = "http://api.giphy.com/v1/gifs/random"
//    let publicBetaApikey = "dc6zaTOxFJmzC"
//    let format = "json"
//    
//    func getRandomImage() -> Image {
//        
//        let params = ["api_key" : publicBetaApikey, "fmt" : format]
//        do {
//            try setRequest(params: params as [String : AnyObject]?)
//        } catch {
//            print("Load faild!")
//            self.delegate.failure()
//        }
//        return image
//    }
//    
//    func setRequest(params: [String : AnyObject]?) throws {
//        request(giphyUrl, method: .get, parameters: params).responseJSON { (json) in
//            
//            if let data = json.data {
//                let json = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
//                do {
//                //try self.parsingJson(json: json)
//                    print(json!)
//                   self.image = Image(json: json!)
//                } catch {
//                    print("Json file is broken")
//                }
//            }
//        }
//    }
//    
//    func parsingJson(json: NSDictionary?) throws{
//        
//        
//        
////        if let image = Image(json: json!) {
////            do {
////            try self.delegate.updatePictureInfo(image: image)
////            } catch {
////                self.delegate.failure()
////            }
//        
////        if json == nil {
////            self.delegate.failure()
////        } else {
////            var image = Image(json: json!)
////            delegate.updatePictureInfo(picture: image)
////            image = Image(json: json!)
//            
//        //}
//   // }
//}
    
}
