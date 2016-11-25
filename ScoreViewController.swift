//
//  ScoreViewController.swift
//  TestTaskGiphyPictures
//
//  Created by Семен Осипов on 24.11.16.
//  Copyright © 2016 Семен Осипов. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var leftScore: Int16!
    var rightScore: Int16!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "\(leftScore!) - \(rightScore!)"
        
        if leftScore > rightScore {
            detailLabel.text = "Left is better ;)"
        }
        if rightScore > leftScore {
            detailLabel.text = "Right is better ;)"
        }
        if rightScore == leftScore {
            detailLabel.text = "Dead heat ;)"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
