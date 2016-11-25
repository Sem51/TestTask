//
//  GameViewController.swift
//  TestTaskGiphyPictures
//
//  Created by Семен Осипов on 23.11.16.
//  Copyright © 2016 Семен Осипов. All rights reserved.
//

import UIKit
import AlamofireImage

class GameViewController: UIViewController {

    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var model: GiphyAppModel!
    var request = Request()
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftImage.image = image1
        rightImage.image = image2
        
        scoreLabel.text = "\(model.leftScore) - \(model.rigtScore)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
 
    
//    func imageTapped(img: AnyObject)
//    {
//        model.leftScore = model.leftScore + 1
//        scoreLabel.text = "\(model.leftScore) - \(model.rigtScore)"
//    }
//
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Score" {
            let destinationViewController = segue.destination as! ScoreViewController
            destinationViewController.leftScore = model.leftScore
            destinationViewController.rightScore = model.rigtScore
        }
    }
    
    @IBAction func pressLeftPicture(_ sender: Any) {
        model.leftScore = model.leftScore + 1
        model.imageOne = model.imageReserv
        image1 = image3
        leftImage.image = image1
        pictureRefresh()
    }
    @IBAction func pressRightPicture(_ sender: Any) {
        model.rigtScore = model.rigtScore + 1
        model.imageTwo = model.imageReserv
        image2 = image3
        rightImage.image = image2
        pictureRefresh()
    }
    
    func pictureRefresh() {
        scoreLabel.text = "\(model.leftScore) - \(model.rigtScore)"
        model.imageReserv = request.getRandomImage()
        image3 = UIImage.gifImageWithURL(model.imageReserv.originalImageUrl)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
