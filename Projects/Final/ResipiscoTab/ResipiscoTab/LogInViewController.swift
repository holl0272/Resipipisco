//
//  LogInViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/14/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    var appInit:Int = 0
    
    var x:String = ""
    var y:String = ""
    var z:String = ""
    var pause:Bool = false
    var attempts:Int = 0
    var pinCode:String = ""
    
    var dataPassed:String!
    
    @IBOutlet weak var hiddenCodeField: UITextField!
    
    @IBOutlet weak var welcomeButton: UIButton!
    
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
        
        if(self.pause == false) {
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
            
            if(self.pinCode == self.x) {
                var delay = 0.25 * Double(NSEC_PER_SEC)
                var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue(), {
                    self.tabBarController?.selectedIndex = 2
                })
            }
            else {
                self.attempts++
                self.pause = true
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
                    self.pause = false
                })
            }
        }
        
        if(self.attempts >= 1) {
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
        
        var getInspired:RandomInspiration = RandomInspiration()

        self.loadFromDefaults()
        
        if(self.z == "0") {
        
            if((self.x == "") || (self.y == "1")) {
                //clear recovered value from defaultsMgr
                self.defaultsMgr.setValue("0", forKey:"recovered")
                //loads center tab on app init
                self.tabBarController?.selectedIndex = 2
            }
        }
        else if(self.z == "initiated") {
            self.defaultsMgr.setValue("0", forKey:"appInit")
            self.tabBarController?.selectedIndex = 2
        }
        else {
            println(self.z)
            let alertController = UIAlertController(title: "Congratulations", message:
                "You are on your way! Just a few bits of information before you get started", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default,handler: { action in self.performSegueWithIdentifier("AppInitView", sender: self) }))
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    func saveInDefaults() {

        //self.defaultsMgr.setValue(pinCode, forKey:"pinCode")
    }
    
    func loadFromDefaults() {
        
        if let pinCodeValue = self.defaultsMgr.valueForKey("pinCode") as? String {
            self.x = pinCodeValue
        }
        
        if let pinCodeRecovered = self.defaultsMgr.valueForKey("recovered") as? String {
            self.y = pinCodeRecovered
        }
        
        if let welcomeView = self.defaultsMgr.valueForKey("appInit") as? String {
            self.z = welcomeView
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
