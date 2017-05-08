//
//  ViewController.swift
//  War
//
//  Created by gopikrishna saripuri on 5/7/17.
//  Copyright © 2017 gopikrishna saripuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    var rightScore:Int = 0
    var leftScore:Int = 0
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    let cardNames = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]
    
    @IBAction func dealTapped(_ sender: Any) {
        print("Deal tapped")
        let leftNumber:Int = Int(arc4random_uniform(13))
        let rightNumber:Int = Int(arc4random_uniform(13))
        leftImageView.image = UIImage(named: cardNames[leftNumber])
        rightImageView.image = UIImage(named: cardNames[rightNumber])
        if leftNumber > rightNumber {
            // Leftcard wins
            leftScore += 1
            
            leftScoreLabel.text = String(leftScore)
        } else if leftNumber == rightNumber {
            
        } else {
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
        }
        
        if leftScore == 10 || rightScore == 10 {
            var message:String
            if leftScore > rightScore {
                message = "Player Wins by " + String(leftScore - rightScore) + " points."
            } else {
                message = "CPU Wins by " + String(rightScore - leftScore) + " points."
            }
            
            let alert = UIAlertController(title: "GameOver", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            rightScoreLabel.text = String(0)
            leftScoreLabel.text = String(0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

