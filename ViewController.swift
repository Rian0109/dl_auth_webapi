//
//  ViewController.swift
//  Naked Salad Bowl
//
//  Created by Alton on 8/18/15.
//  Copyright (c) 2015 Alton Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playerNumberText: UITextField!
    var playerNumberPicker: UIPickerView = UIPickerView()
    var pickerData = ["4", "6", "8", "10"]
    var playerNumber:Int! = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerNumberPicker.dataSource = self
        playerNumberPicker.delegate = self
        playerNumberText.inputView = playerNumberPicker
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    func keyboardWillShow(notification: NSNotification) {
//        
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
//            self.view.frame.origin.y -= keyboardSize.height
//        }
//        
//    }
//    
//    func keyboardWillHide(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
//            self.view.frame.origin.y += keyboardSize.height
//        }
//    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toWrite") {
            var svc = segue.destinationViewController as SecondViewController;
            svc.playerNumber = self.playerNumber
        }
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        playerNumberText.text = pickerData[row]
        playerNumber = pickerData[row].toInt()
        playerNumberText.endEditing(true)
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if playerNumber != 0 {
            return true
        }
        return false
    }
    
    @IBAction func playButtonPressed(sender: UIButton) {
        if shouldPerformSegueWithIdentifier("toWrite", sender: sender) {
            performSegueWithIdentifier("toWrite", sender: playButton)
        }
    }
}

