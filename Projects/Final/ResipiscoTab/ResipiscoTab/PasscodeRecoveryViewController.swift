//
//  PasscodeRecoveryViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/17/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class PasscodeRecoveryViewController: UIViewController {
    
    var soberDate:String = ""
    
    var scrollDate:String = ""
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBAction func myDateView(sender: UIDatePicker) {
        self.scrollDate = printDate(sender.date)
    }
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    @IBAction func submitButton(sender: UIButton) {
        self.defaultsMgr.setValue("1", forKey:"recovered")
        self.performSegueWithIdentifier("passCodeRecovery", sender:self)
    }
    
    @IBAction func cancelButton(sender: UIButton) {
        self.performSegueWithIdentifier("passCodeRecovery", sender:self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.soberDate = loadFromDefaults()

        // Do any additional setup after loading the view.
        myDatePicker.datePickerMode = UIDatePickerMode.Date
        let currentDate = NSDate()  //5 -  get the current date
        myDatePicker.date = currentDate //7 - defaults to current tim
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
    
    func loadFromDefaults() -> String {
        var soberDateString:String = ""
        if let savedDate = self.defaultsMgr.valueForKey("soberDate") as? String {
            soberDateString = savedDate
        }
        return soberDateString
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject?) -> Bool {
                if (identifier == "passCodeRecovery") {
                    if(self.scrollDate != self.soberDate) {
                        let alertController = UIAlertController(title: "Recovery Reminder", message:
                            "Select the recovery date you entered when setting up your profile", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                        return false
                    }
                    else {
                     return true
                    }
        
                }
        return true
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
