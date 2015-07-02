//
//  ViewController.swift
//  Dismiss
//
//  Created by William Martin on 5/14/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    @IBAction func onDismissButtonTapped(sender: AnyObject) {
        println(self.presentingViewController)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

