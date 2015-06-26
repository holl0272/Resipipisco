//
//  AppInitViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/23/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class AppInitViewController: UIViewController {
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()

    var scrollDate:String = ""
    
    @IBOutlet weak var soberDate: UIDatePicker!
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBAction func soberDatePciker(sender: UIDatePicker) {
        
        self.scrollDate = printDate(sender.date)
        
        self.defaultsMgr.setValue(self.scrollDate, forKey:"soberDate")
    }
    
    @IBAction func noPasscodeButton(sender: UIButton) {
        let alertController = UIAlertController(title: "Privacy Settings", message:
                "You can change your preferences at anytime through the Settings Menu of your Day Counter.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK, thanks!", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func yesPasscodeButton(sender: UIButton) {
    }
    
    @IBAction func getStarted(sender: UIButton) {
        saveInDefaults()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
