//
//  LogInViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/14/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    var attempts:Int = 0
    var pinCode:String = ""
    
    @IBOutlet weak var pinCodeFromMemory: UILabel!
    @IBOutlet weak var hiddenCodeField: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var forgotPasscodeButton: UIButton!
    
    @IBOutlet weak var dot_1: UIImageView!
    @IBOutlet weak var dot_2: UIImageView!
    @IBOutlet weak var dot_3: UIImageView!
    @IBOutlet weak var dot_4: UIImageView!

    @IBAction func onButtonPressed(sender:UIButton) {
        
        //image vars
        let fullDot: UIImage? = UIImage(named: "full_dot")
        let emptyDot: UIImage? = UIImage(named: "empty_dot")
        
        //set button
        let buttonText:String = sender.titleLabel!.text!
        
        if(buttonText != "<") {
            if(self.pinCode == "") {
                self.pinCode = buttonText
                self.deleteButton.hidden = false
            }
            else {
                if(count(self.pinCode) < 4) {
                    self.appendNewDigit(buttonText)
                }
            }
        }
        else {
            if(count(self.pinCode) == 1) {
                self.dot_1.image = emptyDot
                self.deleteButton.hidden = true
            }
            else if(count(self.pinCode) == 2) {
                self.dot_2.image = emptyDot
            }
            else if(count(self.pinCode) == 3) {
                self.dot_3.image = emptyDot
            }
            self.pinCode = self.pinCode.substringToIndex(self.pinCode.endIndex.predecessor())

        }
        
        if(count(self.pinCode) == 1) {
            self.dot_1.image = fullDot
        }
        else if(count(self.pinCode) == 2) {
            self.dot_2.image = fullDot
        }
        else if(count(self.pinCode) == 3) {
            self.dot_3.image = fullDot
        }
        else if(count(self.pinCode) == 4) {
            
            self.dot_4.image = fullDot
            
            if(self.pinCode == self.pinCodeFromMemory.text!) {
                var delay = 0.25 * Double(NSEC_PER_SEC)
                var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue(), {
                    self.tabBarController?.selectedIndex = 2
                })
            }
            else {
                self.attempts++
                self.pinCode = ""
                self.deleteButton.hidden = true
                self.titleLabel.text! = "The pin you entered is not correct"
                
                let animation = CABasicAnimation(keyPath: "position")
                animation.duration = 0.075
                animation.repeatCount = 4
                animation.autoreverses = true

                animation.fromValue = NSValue(CGPoint: CGPointMake(dot_1.center.x - 10, dot_1.center.y))
                animation.toValue = NSValue(CGPoint: CGPointMake(dot_1.center.x + 10, dot_1.center.y))
                dot_1.layer.addAnimation(animation, forKey: "position")

                animation.fromValue = NSValue(CGPoint: CGPointMake(dot_2.center.x - 10, dot_2.center.y))
                animation.toValue = NSValue(CGPoint: CGPointMake(dot_2.center.x + 10, dot_2.center.y))
                dot_2.layer.addAnimation(animation, forKey: "position")
                
                animation.fromValue = NSValue(CGPoint: CGPointMake(dot_3.center.x - 10, dot_3.center.y))
                animation.toValue = NSValue(CGPoint: CGPointMake(dot_3.center.x + 10, dot_3.center.y))
                dot_3.layer.addAnimation(animation, forKey: "position")
                
                animation.fromValue = NSValue(CGPoint: CGPointMake(dot_4.center.x - 10, dot_4.center.y))
                animation.toValue = NSValue(CGPoint: CGPointMake(dot_4.center.x + 10, dot_4.center.y))
                dot_4.layer.addAnimation(animation, forKey: "position")
                
                var delay = 1.25 * Double(NSEC_PER_SEC)
                var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue(), {
                    self.dot_1.image = emptyDot
                    self.dot_2.image = emptyDot
                    self.dot_3.image = emptyDot
                    self.dot_4.image = emptyDot
                    self.titleLabel.text! = "Enter Passcode"
                })
            }
        }
        
        if(self.attempts >= 3) {
            self.forgotPasscodeButton.hidden = false
        }
        
        //update display value
        self.hiddenCodeField.text! = self.pinCode
        
    }
    
    func appendNewDigit(digit:String) {
        self.pinCode += digit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.tabBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //check for pin
    override func viewWillAppear(animated: Bool) {

        self.loadFromDefaults()
        
        if(self.pinCodeFromMemory.text! == "") {
            //loads center tab on app init
            self.tabBarController?.selectedIndex = 2
        }
 

        
    }
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    func saveInDefaults() {

        //self.defaultsMgr.setValue(pinCode, forKey:"pinCode")
    }
    
    func loadFromDefaults() {
        
        if let pinCodeValue = self.defaultsMgr.valueForKey("pinCode") as? String {
            self.pinCodeFromMemory.text! = pinCodeValue
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
