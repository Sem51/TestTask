//
//  GiphyAppModel.swift
//  TestTaskGiphyPictures
//
//  Created by Семен Осипов on 24.11.16.
//  Copyright © 2016 Семен Осипов. All rights reserved.
//

import Foundation
import UIKit

enum Type: String {
    case Gif = "gif"
    case Mp4 = "mp4"
}

class GiphyAppModel {
    
    var leftScore: Int16 = 0
    var rigtScore: Int16 = 0
    
    var imageOne: Image!
    var imageTwo: Image!
    var imageReserv: Image!
   
}

class Image {
    let type: Type
    let id: String
    let originalImageUrl: String
    
    init(type: Type, id: String, originalImageUrl: String) {
        self.type = type
        self.id = id
        self.originalImageUrl = originalImageUrl
    }
    
    init?(json: NSDictionary) {
        let dataKey = json["data"] as! NSDictionary
        type = Type(rawValue: dataKey["type"] as! String)!
        id = dataKey["id"] as! String
        originalImageUrl = dataKey["image_original_url"] as! String
    }
    
    init(image: Image) {
        self.type = image.type
        self.id = image.id
        self.originalImageUrl = image.originalImageUrl
    }
}
