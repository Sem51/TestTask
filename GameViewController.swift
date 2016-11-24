//
//  GameViewController.swift
//  TestTaskGiphyPictures
//
//  Created by Семен Осипов on 23.11.16.
//  Copyright © 2016 Семен Осипов. All rights reserved.
//

import UIKit
import AlamofireImage
import SwiftGif

class GameViewController: UIViewController, giphyDelegate {
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    var model = GiphyAppModel()
    var request = Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.request.delegate = self
        
        request.getRandomImage()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func failure() {
        // No connection internet
        let networkController = UIAlertController(title: "Error", message: "No connection!", preferredStyle: UIAlertControllerStyle.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        networkController.addAction(okButton)
        self.present(networkController, animated: true, completion: nil)
    }
    
    //MARK: giphyDelegate
    
    func updatePictureInfo(picture: Image) {
        
        
        let url = URL(string: picture.originalImageUrl)
        leftImage.af_setImage(withURL: url!)
        
    }
}
