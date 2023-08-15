//
//  SecondViewController.swift
//  Naked Salad Bowl
//
//  Created by Alton on 8/21/15.
//  Copyright (c) 2015 Alton Lin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    @IBOutlet weak var wordOne: UITextField!
    @IBOutlet weak var wordTwo: UITextField!
    @IBOutlet weak var wordThree: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cardNumberLabel: UILabel!
    var playerNumber:Int!
    var cardNumber:Int = 1
    var playerWords:[[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if cardNumber > playerNumber {
            return true
        }
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toPlay") {
            var tvc = segue.destinationViewController as ThirdViewController;
            tvc.playerWords = self.playerWords
        }
    }

    @IBAction func playButtonPressed(sender: UIButton) {
        if shouldPerformSegueWithIdentifier("toPlay", sender: okButton){
            performSegueWithIdentifier("toPlay", sender: okButton)
        }
    }
    
    @IBAction func okButtonPressed(sender: UIButton) {
        if cardNumber <= playerNumber {
            if wordOne.text != "" && wordTwo.text != "" && wordThree.text != ""  && cardNumber != playerNumber {
                var card:[String] = [wordOne.text, wordTwo.text, wordThree.text]
                playerWords.append(card)
                wordOne.text = nil
                wordTwo.text = nil
                wordThree.text = nil
                if cardNumber == playerNumber - 1 {
                    okButton.setTitle("Play", forState: UIControlState.Normal)
                }
                cardNumberLabel.text = String(cardNumber + 1)
                cardNumber++
            } else if wordOne.text != "" && wordTwo.text != "" && wordThree.text != "" {
                var card:[String] = [wordOne.text, wordTwo.text, wordThree.text]
                playerWords.append(card)
                cardNumber++
            }
        }
    }
}

