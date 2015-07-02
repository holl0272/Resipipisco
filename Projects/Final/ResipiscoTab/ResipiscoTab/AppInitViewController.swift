//
//  AppInitViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/23/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class AppInitViewController: UIViewController, UITextFieldDelegate {
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()

    var userName:String = ""
    var scrollDate:String = ""
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var saveName: UIButton!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var staticMessage: UILabel!
    
    @IBOutlet weak var passCodeLabel: UILabel!
    @IBOutlet weak var passCodeInput: UITextField!
    @IBOutlet weak var savePasscode: UIButton!
    @IBOutlet weak var cancelPasscode: UIButton!
    @IBOutlet weak var cancelSavePasscord: UIButton!
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var coverOne: UIView!
    @IBOutlet weak var coverTwo: UIView!
    @IBOutlet weak var coverThree: UIView!
    
    @IBOutlet weak var soberDate: UIDatePicker!
    @IBOutlet weak var saveDateButton: UIButton!
    @IBOutlet weak var selectSobrietyDate: UILabel!
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBAction func saveName(sender: UIButton) {
        var name = self.nameField.text!
        self.greetingLabel.text! = "Hi, \(name)!"
        self.defaultsMgr.setValue(name, forKey:"name")
        self.staticMessage.hidden = false
        self.saveName.hidden = true
        self.coverOne.hidden = true
        self.coverThree.hidden = false
    }
    
    @IBAction func saveDate(sender: UIButton) {
        self.coverOne.hidden = false
        self.coverTwo.hidden = true
    }
    
    @IBAction func soberDatePciker(sender: UIDatePicker) {
        
        self.scrollDate = printDate(sender.date)
        self.defaultsMgr.setValue(self.scrollDate, forKey:"soberDate")
        self.saveDateButton.hidden = false
        self.selectSobrietyDate.hidden = true
    }
    
    func hidePassCode(alert: UIAlertAction!) {
        self.yesButton.hidden = false
        self.savePasscode.hidden = true
        self.passCodeLabel.hidden = true
        self.passCodeInput.hidden = true
        self.passCodeInput.text = ""
        self.defaultsMgr.setValue("", forKey:"pinCode")
        self.getStartedButton.hidden = false
    }
    
    
    @IBAction func noPasscodeButton(sender: UIButton) {
        let alertController = UIAlertController(title: "Privacy Settings", message:
                "You can change your preferences at anytime through the Settings Menu of your Day Counter.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK, thanks!", style: UIAlertActionStyle.Default,handler: hidePassCode))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func yesPasscodeButton(sender: UIButton) {
        self.yesButton.hidden = true
        self.noButton.hidden = true
        self.passCodeLabel.hidden = false
        self.passCodeInput.hidden = false
        self.cancelPasscode.hidden = false
    }
    
    @IBAction func savePasscode(sender: UIButton) {
        var pinCode = passCodeInput.text!
        self.savePasscode.hidden = true
        self.defaultsMgr.setValue(pinCode, forKey:"pinCode")
        self.getStartedButton.hidden = false
        self.cancelSavePasscord.hidden = true
    }
    
    @IBAction func cancelSave(sender: AnyObject) {
        self.yesButton.hidden = false
        self.noButton.hidden = false
        self.cancelPasscode.hidden = true
        self.cancelSavePasscord.hidden = true
        self.savePasscode.hidden = true
        self.passCodeLabel.hidden = true
        self.passCodeInput.hidden = true
        self.passCodeInput.text = ""
        self.defaultsMgr.setValue("", forKey:"pinCode")
    }
    
    @IBAction func getStarted(sender: UIButton) {
        saveInDefaults()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passCodeInput.delegate = self
        self.nameField.delegate = self
        
        // Do any additional setup after loading the view.
        soberDate.datePickerMode = UIDatePickerMode.Date
        let currentDate = NSDate()  //5 -  get the current date
        soberDate.date = currentDate //7 - defaults to current tim

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func saveInDefaults() {
        self.defaultsMgr.setValue("initiated", forKey:"appInit")
    }
    
    func printDate(date:NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        
        var theDateFormat = NSDateFormatterStyle.ShortStyle
        
        dateFormatter.dateStyle = theDateFormat
        
        return dateFormatter.stringFromDate(date)
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if(textField.tag == 1) {
            
            let pinCodeLength = count(textField.text.utf16) - range.length
        
            if(pinCodeLength <= 3) {
                self.savePasscode.hidden = true
                if(pinCodeLength == 3) {
                    self.cancelPasscode.hidden = true
                    self.cancelSavePasscord.hidden = false
                    self.savePasscode.hidden = false
                }
                return true
            }
            else {
                return false
            }
        }
        else {
            //put name text field here
            let nameLength = count(textField.text.utf16) - range.length
            
            if(nameLength > 0) {
                self.saveName.hidden = false
                
            }
            return true
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
