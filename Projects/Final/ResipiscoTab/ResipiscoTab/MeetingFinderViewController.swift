//
//  MeetingFinderViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/14/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class MeetingFinderViewController: UIViewController {
    
    
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

//        //hide the LogInViewController Tab
//        if let tabBarController = self.tabBarController {
//            let indexToRemove = 0
//            if indexToRemove < tabBarController.viewControllers?.count {
//                var viewControllers = tabBarController.viewControllers
//                    viewControllers?.removeAtIndex(indexToRemove)
//                    tabBarController.viewControllers = viewControllers
//            }
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        //let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
//    override func viewWillAppear(animated: Bool) {
//        //self.defaultsMgr.setValue("1234", forKey:"pinCode")
//        self.tabBarController?.tabBar.hidden = false
//        
//    }
//    
    



}

