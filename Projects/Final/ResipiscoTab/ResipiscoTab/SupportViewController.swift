//
//  SupportViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/14/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController {
    
    var getInspired = RandomInspiration()
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var secondContainerView: UIView!
    @IBOutlet weak var thirdContainerView: UIView!
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        self.getInspired = RandomInspiration()
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            performSegueWithIdentifier("contactsTable", sender: self)
            secondContainerView.hidden = true
            thirdContainerView.hidden = true
        case 1:
            secondContainerView.hidden = false
            thirdContainerView.hidden = true
        case 2:
            secondContainerView.hidden = true
            thirdContainerView.hidden = false
        default:
            break;
        }
        
        if (secondContainerView.hidden == false) {
            
            var sponsorPhoneNumber:String = loadSponsorFromDefaults()
            var sponsorButtonStatus = loadShowSponsorFromDefaults()
            if(sponsorButtonStatus == "1") {
                secondContainerView.viewWithTag(1)?.hidden = false
                var hiddenLabel = secondContainerView.viewWithTag(2) as? UILabel
                hiddenLabel?.text! = sponsorPhoneNumber
            }
            else {
                secondContainerView.viewWithTag(1)?.hidden = true
            }
            
            getRandomInspiration()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        thirdContainerView.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBarHidden = true
        self.tabBarController?.tabBar.hidden = false
    }
        
    @IBAction func backFromContactsTable(segue: UIStoryboardSegue) {
        self.tabBarController?.selectedIndex = 2
        segmentedControl.selectedSegmentIndex = 1
        secondContainerView.hidden = false
        thirdContainerView.hidden = true
        getRandomInspiration()
    }
    
    func loadShowSponsorFromDefaults() -> String {
        var sponsorSwitchState:String = ""
        if let sponsorValue = self.defaultsMgr.valueForKey("showSponsor") as? String {
            sponsorSwitchState = sponsorValue
        }
        return sponsorSwitchState
    }
    
    func loadSponsorFromDefaults() -> String {
        var sponsorNumberString:String = ""
        if let sponsorNumber = self.defaultsMgr.valueForKey("sponsor") as? String {
            sponsorNumberString = sponsorNumber
        }
        return sponsorNumberString
    }
    
    func getRandomInspiration() {
        var inspirationField = secondContainerView.viewWithTag(3) as? UITextView
        var inAppInspiration = loadInAppInspirationSettingFromDefaults() as Bool
        
        if(inAppInspiration) {
            inspirationField?.text! = getInspired.returnQuote()
        }
    }
    
    func loadInAppInspirationSettingFromDefaults() -> Bool {
        var showInspiration:Bool!
        if let inAppSetting = self.defaultsMgr.valueForKey("inAppInspiration") as? Bool {
            showInspiration = inAppSetting
        }
        return showInspiration
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
