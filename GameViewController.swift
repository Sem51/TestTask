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
    
    let tapRec = UITapGestureRecognizer()
    
    @IBOutlet weak var scoreButton: UIButton!
    
    var model: GiphyAppModel!
    var request = Request()
    
    var scores: [Score] = []
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        leftImage.isUserInteractionEnabled = true
        leftImage.addGestureRecognizer(tapGestureRecognizer)
        
        //self.request.delegate = self
        
        leftImage.image = image1
        rightImage.image = image2
        scoreButton.titleLabel?.text = "\(model.leftScore) - \(model.rigtScore)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(img: AnyObject)
    {
        model.leftScore = model.leftScore + 1
        scoreButton.titleLabel?.text = "\(model.leftScore) - \(model.rigtScore)"
        
        //saveToCoreData()
    }
    
    func saveToCoreData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //context.delete(self.scores[0])
        //(UIApplication.shared.delegate as! AppDelegate).saveContext()
        let scoreCoreData = Score(context: context)
        scoreCoreData.leftPictures = model.leftScore
        scoreCoreData.rightPictures = model.rigtScore
        
        
        
        do {
            try context.save()
        } catch {
            print(error)
            return
        }
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
