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
        
        DispatchQueue.main.async {
            self.leftImage.image = self.image1
            self.rightImage.image = self.image2
        }
        
        scoreLabel.text = "\(model.leftScore) - \(model.rigtScore)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
        DispatchQueue.main.async {
            self.leftImage.image = self.image1
        }
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
        
        let backgroundQueue = DispatchQueue(label: "load",
                                            qos: .background,
                                            target: nil)
        
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
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
