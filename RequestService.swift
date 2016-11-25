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

enum RequestError: Error {
    case loadFailed
    case jsonFileIsBroken
}

class Request {

    var image: Image!
    
    let giphyUrl = "http://api.giphy.com/v1/gifs/random"
    let publicBetaApikey = "dc6zaTOxFJmzC"
    let format = "json"
    
    func getRandomImage() -> Image {
        
        let params = ["api_key" : publicBetaApikey, "fmt" : format]
        
        request(giphyUrl, method: .get, parameters: params).responseJSON { response in
            if let data = response.data {
                print(data)
                let json = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                if let jsonDictionary = json {
                    print(jsonDictionary)
                    self.image = Image(json: jsonDictionary)
                } else {
                    print("Load Failed")
                }
            }
        }
        if image != nil {
            return image
        } else {
            print("Create image object error!")
            return Image(type: .Gif, id: "", originalImageUrl: "http://s3.amazonaws.com/giphygifs/media/Ggjwvmqktuvf2/giphy.gif")
            
        }
        
    }
}
