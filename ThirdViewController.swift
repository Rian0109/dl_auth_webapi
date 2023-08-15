//
//  ThirdViewController.swift
//  Naked Salad Bowl
//
//  Created by Alton on 8/21/15.
//  Copyright (c) 2015 Alton Lin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController{
    @IBOutlet weak var firstWord: UILabel!
    @IBOutlet weak var secondWord: UILabel!
    @IBOutlet weak var thirdWord: UILabel!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var playScreen: UIView!
    @IBOutlet weak var startScreen: UIView!
    @IBOutlet var completeView: UIView!
    @IBOutlet weak var succeedButton: UIButton!
    @IBOutlet weak var failButton: UIButton!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var team1Score: UILabel!
    @IBOutlet weak var team2Score: UILabel!
    
    var playerWords:[[String]] = []
    var wordHolder:[[String]] = []
    var wordCount:Int = 0
    var timerInstance = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeView.bringSubviewToFront(startScreen)
        wordHolder = sorted(playerWords) {_, _ in arc4random() % 2 == 0}
        wordCount = wordHolder.count
        var words:[String] = wordHolder.first!
        firstWord.text = words[0]
        secondWord.text = words[1]
        thirdWord.text = words[2]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        if timer.text? == "0" {
            if teamLabel.text? == "Team 1" {
                teamLabel.text = "Team 2"
            } else {
                teamLabel.text = "Team 1"
            }
            completeView.bringSubviewToFront(startScreen)
            timerInstance.invalidate()
            timer.text = "60"
        }
        var startTime:Int? = timer.text?.toInt()
        startTime!--
        timer.text = String(startTime!)
    }
    
    
    @IBAction func succeed(sender: UIButton) {
        if teamLabel.text? == "Team 1" {
            var score:Int? = team1Score.text?.toInt()
            score!++
            team1Score.text = String(score!)
        } else {
            var score:Int? = team2Score.text?.toInt()
            score!++
            team2Score.text = String(score!)
        }
        if wordHolder.count == 1 {
            viewDidLoad()
        }
        wordHolder.removeAtIndex(0)
        var words:[String] = wordHolder.first!
        firstWord.text = words[0]
        secondWord.text = words[1]
        thirdWord.text = words[2]
    }
    
    @IBAction func failed(sender: UIButton) {
        wordHolder = sorted(wordHolder) {_, _ in arc4random() % 2 == 0}
        var words:[String] = wordHolder.first!
        firstWord.text = words[0]
        secondWord.text = words[1]
        thirdWord.text = words[2]
    }
    
    @IBAction func startRound(sender: UIButton) {
        completeView.bringSubviewToFront(playScreen)
        timerInstance = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    
}

