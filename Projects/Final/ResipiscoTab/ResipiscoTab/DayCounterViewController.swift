//
//  DayCounterViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/14/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class DayCounterViewController: UIViewController {
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    var savedPasscode:String = ""

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var firstContainerView: UIView!
    @IBOutlet weak var secondContainerView: UIView!
    @IBOutlet weak var thirdContainerView: UIView!
        
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            firstContainerView.hidden = false
            secondContainerView.hidden = true
            thirdContainerView.hidden = true
        case 1:
            firstContainerView.hidden = true
            secondContainerView.hidden = false
            thirdContainerView.hidden = true
        case 2:
            firstContainerView.hidden = true
            secondContainerView.hidden = true
            thirdContainerView.hidden = false
        default:
            break;
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstContainerView.hidden = true
        thirdContainerView.hidden = true
        
        //hide the LogInViewController Tab
        if let tabBarController = self.tabBarController {
            let indexToRemove = 0
            if indexToRemove < tabBarController.viewControllers?.count {
                var viewControllers = tabBarController.viewControllers
                viewControllers?.removeAtIndex(indexToRemove)
                tabBarController.viewControllers = viewControllers
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewWillAppear(animated: Bool) {
//        
//        self.savedPasscode = loadPasscodeFromDefaults()
//        
//        if(self.savedPasscode != "") {
//        
//        }
//        
//        self.tabBarController?.selectedIndex = 1
//    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.savedPasscode = loadPasscodeFromDefaults()
        //self.defaultsMgr.setValue("1234", forKey:"pinCode")
        self.tabBarController?.tabBar.hidden = false
        
    }
    
    func loadPasscodeFromDefaults() -> String {
        var pinCodeString:String = ""
        if let pinCode = self.defaultsMgr.valueForKey("pinCode") as? String {
            pinCodeString = pinCode
        }
        return pinCodeString
    }
    
    override func prepareForSegue(segue:
        UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        firstContainerView.hidden = true
        secondContainerView.hidden = false
        thirdContainerView.hidden = true
            
        segmentedControl.selectedSegmentIndex = 1
        
    }
    
    
    
    
    
//    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
//        if identifier == "Identifier Of Segue Under Scrutiny" {
//            // perform your computation to determine whether segue should occur
//            
//            let segueShouldOccur = true || false // you determine this
//            if !segueShouldOccur {
//                let notPermitted = UIAlertView(title: "Alert", message: "Segue not permitted (better message here)", delegate: nil, cancelButtonTitle: "OK")
//                
//                // shows alert to user
//                notPermitted.show()
//                
//                // prevent segue from occurring
//                return false
//            }
//        }
//        
//        // by default perform the segue transitio
//        return true
//    }

    
}

