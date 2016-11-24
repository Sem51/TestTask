//
//  StartViewController.swift
//  TestTaskGiphyPictures
//
//  Created by Семен Осипов on 24.11.16.
//  Copyright © 2016 Семен Осипов. All rights reserved.
//

import UIKit
import CoreData

class StartViewController: UIViewController, requestDelegate {
    @IBOutlet weak var newGameButton: UIButton!

    @IBOutlet weak var continueGameButton: UIButton!
    var model = GiphyAppModel()
    //var request = Request()
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    var scores: [Score] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = (UIApplication.shared .delegate as! AppDelegate).persistentContainer.viewContext
        do {
            scores = try context.fetch(Score.fetchRequest())
            if scores.count > 0 {
            model.leftScore = scores[0].leftPictures
            model.rigtScore = scores[0].rightPictures
            }
        } catch {
            print("Fetching faild")
        }
        
        let imageTest = Image(type: .Gif, id: "", originalImageUrl: "http://s3.amazonaws.com/giphygifs/media/Ggjwvmqktuvf2/giphy.gif")
        
        model.imageOne = Image(image: imageTest)
        model.imageTwo = Image(image: imageTest)
        model.imageReserv = Image(image: imageTest)
        

//        model.imageOne = Image(image: request.getRandomImage())
//        model.imageTwo = Image(image: request.getRandomImage())
//        model.imageReserv = Image(image: request.getRandomImage())
       
        loadImages()
    }

    func loadImages() {
        image1 = UIImage.gifImageWithURL(model.imageOne.originalImageUrl)
        image2 = UIImage.gifImageWithURL(model.imageTwo.originalImageUrl)
        image3 = UIImage.gifImageWithURL(model.imageReserv.originalImageUrl)
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
    
    //MARK: - RequestDelegate
    func updatePictureInfo(image: Image?) throws {
        
        guard image == nil else {
            throw RequestError.loadFailed
        }
        
        if model.imageOne == nil {
        model.imageOne = image
            
        } else if model.imageTwo == nil{
            model.imageTwo = image
        } else if model.imageReserv == nil {
            model.imageReserv = image
        }
    }
    
    func failure() {
        // No connection internet
        let networkController = UIAlertController(title: "Error", message: "No connection!", preferredStyle: UIAlertControllerStyle.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        networkController.addAction(okButton)
        self.present(networkController, animated: true, completion: nil)
    }
}
