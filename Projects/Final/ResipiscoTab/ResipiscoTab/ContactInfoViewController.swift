//
//  ContactInfoViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/5/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class ContactInfoViewController: UIViewController {
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    var info: String!
    var phone: String!
    
    var getInspired = RandomInspiration()
    
    @IBOutlet var contactName: UILabel!
    @IBOutlet var contactNumber: UILabel!
    
    @IBAction func callButton(sender: UIButton) {
        if let url = NSURL(string: "tel://\(phone)") {
            UIApplication.sharedApplication().openURL(url)
        }
        println("CALLING: \(phone)")
    }
    
    @IBOutlet weak var inspirationField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var delimiter = ":"
        var fullString = info
        var contactInfo = fullString.componentsSeparatedByString(delimiter)
        
        self.contactName!.text = contactInfo[0]
        self.phone = contactInfo[1]
        
        var phoneFormat = NSMutableString(string: contactInfo[1])
        phoneFormat.insertString("(", atIndex: 0)
        phoneFormat.insertString(")", atIndex: 4)
        phoneFormat.insertString(" ", atIndex: 5)
        phoneFormat.insertString("-", atIndex: 9)
        self.contactNumber!.text = phoneFormat as String
        
        var inAppInspiration = loadInAppInspirationSettingFromDefaults() as Bool
        
        if(inAppInspiration) {
            self.inspirationField.text = getInspired.returnQuote()
        }
    }
    
    func loadInAppInspirationSettingFromDefaults() -> Bool {
        var showInspiration:Bool!
        if let inAppSetting = self.defaultsMgr.valueForKey("inAppInspiration") as? Bool {
            showInspiration = inAppSetting
        }
        return showInspiration
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
