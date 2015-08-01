//
//  MoreViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/9/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    
    @IBAction func inspirationMaster(sender: UIButton) {
         performSegueWithIdentifier("inspirationMaster", sender: self)
    }
    
    @IBAction func inspiration(sender: UIButton) {
        performSegueWithIdentifier("inspiration", sender: self)
    }
    
    @IBAction func masterSetting(sender: UIButton) {
        performSegueWithIdentifier("masterSettings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backFromMasterSettings(segue: UIStoryboardSegue) {
        self.tabBarController?.selectedIndex = 4
    }
    
    @IBAction func backFromInspirationMaster(segue: UIStoryboardSegue) {
        self.tabBarController?.selectedIndex = 4
    }
    
    @IBAction func backFromInspiration(segue: UIStoryboardSegue) {
        self.tabBarController?.selectedIndex = 4
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
