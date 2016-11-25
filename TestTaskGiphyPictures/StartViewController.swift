//
//  StartViewController.swift
//  TestTaskGiphyPictures
//
//  Created by Семен Осипов on 24.11.16.
//  Copyright © 2016 Семен Осипов. All rights reserved.
//

import UIKit
import CoreData

class StartViewController: UIViewController {
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var continueGameButton: UIButton!
    
    var model = GiphyAppModel()
    var request = Request()
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //load 3 random image
        
        let backgroundQueue = DispatchQueue(label: "load", qos: .background, target: nil)
        
        backgroundQueue.async() {
            self.request.getRandomImage(
                success: { (image) in
                    let gifImage = UIImage.gifImageWithURL(image.originalImageUrl)
                    
                    DispatchQueue.main.async {
                        self.model.imageOne = image
                        self.image1 = gifImage
                    }
                },
                failure: { (error) in
                    print(error)
                }
            )
        }
        
        backgroundQueue.async() {
            self.request.getRandomImage(
                success: { (image) in
                    let gifImage = UIImage.gifImageWithURL(image.originalImageUrl)
                    
                    DispatchQueue.main.async {
                        self.model.imageTwo = image
                        self.image2 = gifImage
                    }
            },
                failure: { (error) in
                    print(error)
            })
        }
        
        backgroundQueue.async() {
            self.request.getRandomImage(
                success: { (image) in
                    let gifImage = UIImage.gifImageWithURL(image.originalImageUrl)
                    
                    DispatchQueue.main.async {
                        self.model.imageReserv = image
                        self.image3 = gifImage
                    }
            },
                failure: { (error) in
                    print(error)
            })
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StartGame" || segue.identifier == "ContinueGame" {
            let destinationViewController = segue.destination as! GameViewController
            if segue.identifier == "StartGame" {
                model.leftScore = 0
                model.rigtScore = 0
            }
            destinationViewController.model = model
            destinationViewController.image1 = image1
            destinationViewController.image2 = image2
            destinationViewController.image3 = image3
        }

        if segue.identifier == "Score" {
            let destinationViewController = segue.destination as! ScoreViewController
            destinationViewController.leftScore = model.leftScore
            destinationViewController.rightScore = model.rigtScore
        }
    }
}
