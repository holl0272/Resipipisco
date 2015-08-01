//
//  SupportFellowsViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/21/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class SupportFellowsViewController: UIViewController {
    
    @IBOutlet var hiddenSponsorNumber: UILabel!
    
    var getInspired = RandomInspiration()
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    var sponsorSwitchState:String = ""

    @IBOutlet weak var inspirationField: UITextView!
    
    @IBOutlet var mySponsorButton: UIButton!
    @IBOutlet var mySuppotButton: UIButton!

    @IBAction func callSponsor(sender: UIButton) {
        var phone:String = ""
        if(hiddenSponsorNumber != "") {
            phone = hiddenSponsorNumber.text!
            self.hiddenSponsorNumber.text! = ""
        }
        else {
            phone = sponsorNumber
        }
        if let url = NSURL(string: "tel://\(phone)") {
            UIApplication.sharedApplication().openURL(url)
        }
        println("CALLING: \(phone)")
    }
    
    @IBAction func callSupport(sender: UIButton) {
        //var phone = supportNumber
        var phone = "8888277180"
        if let url = NSURL(string: "tel://\(phone)") {
            UIApplication.sharedApplication().openURL(url)
        }
        println("CALLING: \(phone)")
    }
    
    func updateSponsorNumber() {
        println("works")
        var sponsorPhoneNumber:String = loadSponsorFromDefaults()
    }
    
    var sponsorNumber:String = ""
    var supportNumber:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadShowSponsorFromDefaults()
        
        // Do any additional setup after loading the view.
        self.sponsorNumber = loadSponsorFromDefaults()
        self.supportNumber = loadSupportFromDefaults()
        
        if(sponsorSwitchState == "0") {
            self.mySponsorButton.hidden = true
        }
        
        var inAppInspiration = loadInAppInspirationSettingFromDefaults() as Bool
        
        if(inAppInspiration) {
            self.inspirationField.text = getInspired.returnQuote()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInAppInspirationSettingFromDefaults() -> Bool {
        var showInspiration:Bool!
        if let inAppSetting = self.defaultsMgr.valueForKey("inAppInspiration") as? Bool {
            showInspiration = inAppSetting
        }
        return showInspiration
    }
    
    func loadSponsorFromDefaults() -> String {
        var sponsorNumberString:String = ""
        if let sponsorNumber = self.defaultsMgr.valueForKey("sponsor") as? String {
            sponsorNumberString = sponsorNumber
        }
        return sponsorNumberString
    }
    
    func loadSupportFromDefaults() -> String {
        var supportNumberString:String = ""
        if let supportrNumber = self.defaultsMgr.valueForKey("supportNumber") as? String {
            supportNumberString = supportNumber
        }
        return supportNumberString
    }
    
    func loadShowSponsorFromDefaults() {
        if let sponsorValue = self.defaultsMgr.valueForKey("showSponsor") as? String {
            sponsorSwitchState = sponsorValue
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
