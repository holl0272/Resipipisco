//
//  DayCounterSettingsViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/19/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class TextFieldDelegate : UIResponder, UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class DayCounterSettingsViewController: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func didTapView(){
        self.view.endEditing(true)
    }
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    var savedSoberDate:String = ""
    var savedPasscode:String = ""
    var scrollDate:String = ""

    @IBOutlet weak var yourNameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var savePasscode: UIButton!
    @IBOutlet weak var soberDate: UIDatePicker!
    @IBOutlet weak var yourDateLabel: UILabel!
    @IBOutlet weak var passCodeField: UITextField!
    @IBOutlet weak var doNotLockButton: UIButton!
    @IBOutlet weak var changeNameButton: UIButton!
    @IBOutlet weak var saveNameButton: UIButton!
    
    @IBAction func doNotLock(sender: UIButton) {
        self.passCodeField.text! = ""
        self.doNotLockButton.hidden = true
        self.defaultsMgr.setValue("", forKey:"pinCode")
    }
    
    @IBAction func saveNameChange(sender: UIButton) {
        
        func noName(alert: UIAlertAction!) {
            self.defaultsMgr.setValue("", forKey:"name")
            self.yourNameLabel.text! = "Your Name"
            self.changeNameButton.hidden = false
            self.saveNameButton.hidden = true
        }
        
        var name = self.nameField.text!
        
        if(name != "") {
            self.defaultsMgr.setValue(name, forKey:"name")
            self.yourNameLabel.text! = "\(name), your name has been updated!"
            self.changeNameButton.hidden = false
            self.saveNameButton.hidden = true
        }
        else {
            let alertController = UIAlertController(title: "Personalization", message:
                "Are you sure you want to remove your name?", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default,handler: noName))
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func changeName(sender: UIButton) {
        self.nameField.text! = ""
        self.changeNameButton.hidden = true
    }
    
    @IBAction func soberDatePicker(sender: UIDatePicker) {
        self.scrollDate = printDate(sender.date)
        self.defaultsMgr.setValue(self.scrollDate, forKey:"soberDate")
        self.yourDateLabel.text! = "Your Sobriety Date has been updated!"
    }
    
    @IBAction func savePasscode(sender: UIButton) {
        var pinCode = passCodeField.text!
        self.savePasscode.hidden = true
        self.doNotLockButton.hidden = false
        self.defaultsMgr.setValue(pinCode, forKey:"pinCode")
    }
    
    func resetApp(alert: UIAlertAction!) {
        self.defaultsMgr.setValue("", forKey:"name")
        self.defaultsMgr.setValue("", forKey:"appInit")
        self.defaultsMgr.setValue("", forKey:"pinCode")
        self.defaultsMgr.setValue("", forKey:"soberDate")
        self.performSegueWithIdentifier("resetApp", sender: self)
    }

    @IBAction func resetDefaults(sender: UIButton) {

        let alertController = UIAlertController(title: "ALERT", message:
            "You are about to clear all your saved data!  Are you Sure you want to do that?", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default,handler: resetApp))
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passCodeField.delegate = self
        self.nameField.delegate = self
        
        self.nameField.text! = loadNameFromDefaults()
        
        self.savedSoberDate = loadDateFromDefaults()
        self.savedPasscode = loadPasscodeFromDefaults()
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: "didTapView")
        self.view.addGestureRecognizer(tapRecognizer)

        // Do any additional setup after loading the view.
        soberDate.datePickerMode = UIDatePickerMode.Date
        let currentDate = NSDate()  //5 -  get the current date
        
        if(self.savedSoberDate == "") {
            self.soberDate.date = currentDate
        }
        else {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "M/d/yy"
            let date = dateFormatter.dateFromString(self.savedSoberDate)
            self.soberDate.date = date!
        }
        
        if(self.savedPasscode != "") {
            self.doNotLockButton.hidden = false
            self.passCodeField.text! = self.savedPasscode
        }
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if(textField.tag == 0) {
            self.changeNameButton.hidden = true
            let nameLength = count(textField.text.utf16) - range.length
            if(nameLength > 0) {
                self.saveNameButton.hidden = false
            }
            return true
        }
        else if(textField.tag == 1) {
        
        let pinCodeLength = count(textField.text.utf16) - range.length

            if(pinCodeLength <= 3) {
                self.savePasscode.hidden = true
                self.doNotLockButton.hidden = true
                if(pinCodeLength == 3) {
                    self.savePasscode.hidden = false
                }
                return true
            }
            else {
                return false
            }
        }
        else {
            return true
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printDate(date:NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        
        var theDateFormat = NSDateFormatterStyle.ShortStyle
        
        dateFormatter.dateStyle = theDateFormat
        
        return dateFormatter.stringFromDate(date)
        
    }
    
    func loadNameFromDefaults() -> String {
        var nameString:String = ""
        if let savedName = self.defaultsMgr.valueForKey("name") as? String {
            nameString = savedName
        }
        return nameString
    }
    
    func loadDateFromDefaults() -> String {
        var soberDateString:String = ""
        if let savedDate = self.defaultsMgr.valueForKey("soberDate") as? String {
            soberDateString = savedDate
        }
        return soberDateString
    }
    
    func loadPasscodeFromDefaults() -> String {
        var pinCodeString:String = ""
        if let pinCode = self.defaultsMgr.valueForKey("pinCode") as? String {
            pinCodeString = pinCode
        }
        return pinCodeString
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        self.yourNameLabel.text! = "Your Name"
        self.yourDateLabel.text! = "Your Sobriety Date"
        
    }


}
