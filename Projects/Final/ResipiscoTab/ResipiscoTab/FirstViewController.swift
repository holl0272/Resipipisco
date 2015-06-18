//
//  FirstViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/14/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    self.tabBarController?.tabBar.hidden = false
        
    }
    
    



}

