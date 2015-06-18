//
//  PasscodeRecoveryViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/17/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class PasscodeRecoveryViewController: UIViewController {
    
    let soberDate:String = "8/26/14"
    
    var scrollDate:String = ""

    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBAction func myDateView(sender: UIDatePicker) {
        self.scrollDate = printDate(sender.date)
        
        println(self.scrollDate)
    }
    
    @IBAction func submitButton(sender: UIButton) {
        if(self.scrollDate == self.soberDate) {
            
        }
        else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    

        override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "segueTest" {
            
            if(self.scrollDate != self.soberDate) {
                
                let alertController = UIAlertController(title: "Your Dog Has No Name?!", message:
                    "Oops, looks like you forgot your Dog's name, type it in and try again!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                return false
            }
                
            else {
                return true
            }
        }
        
        // by default, transition
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        //println(dateFormatter.stringFromDate(date))
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
