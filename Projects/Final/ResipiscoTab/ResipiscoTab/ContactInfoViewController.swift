//
//  ContactInfoViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/5/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class ContactInfoViewController: UIViewController {
    
    var info: String!

    @IBOutlet var contactName: UILabel!
    @IBOutlet var contactNumber: UILabel!
    
    @IBAction func callButton(sender: UIButton) {
        var phone = contactNumber.text!
        if let url = NSURL(string: "tel://\(phone)") {
            UIApplication.sharedApplication().openURL(url)
        }
        println("CALLING: \(phone)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var delimiter = ":"
        var fullString = info
        var contactInfo = fullString.componentsSeparatedByString(delimiter)
        
        self.contactName!.text = contactInfo[0]
        self.contactNumber!.text = contactInfo[1]
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
