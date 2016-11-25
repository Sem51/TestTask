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
    
    let tapRec = UITapGestureRecognizer()
    
    var model: GiphyAppModel!
    var request = Request()
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        
        leftImage.isUserInteractionEnabled = true
        leftImage.addGestureRecognizer(tapGestureRecognizer1)
        
        rightImage.isUserInteractionEnabled = true
        rightImage.addGestureRecognizer(tapGestureRecognizer2)
        
        leftImage.image = image1
        rightImage.image = image2
        
        scoreLabel.text = "\(model.leftScore) - \(model.rigtScore)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(img: AnyObject)
    {
        model.leftScore = model.leftScore + 1
        
        scoreLabel.text = "\(model.leftScore) - \(model.rigtScore)"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Score" {
            let destinationViewController = segue.destination as! ScoreViewController
            destinationViewController.leftScore = model.leftScore
            destinationViewController.rightScore = model.rigtScore
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
