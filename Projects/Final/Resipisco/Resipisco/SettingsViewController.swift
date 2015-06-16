//
//  SettingsViewController.swift
//  Resipisco
//
//  Created by Eric Holland on 6/13/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBAction func done() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func reset() {
        let alertController = UIAlertController(title: "Your Dog Has No Name?!", message:
            "Oops, looks like you forgot your Dog's name, type it in and try again!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
