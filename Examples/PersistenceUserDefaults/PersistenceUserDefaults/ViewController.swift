//
//  ViewController.swift
//  PersistenceUserDefaults
//
//  Created by William Martin on 6/8/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var myTextView: UITextView!
    
    @IBAction func onSaveTapped(sender: AnyObject) {
        self.saveInDefaults()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()

    func loadDefaults() {
        if let savedText = self.defaultsMgr.valueForKey("userText") as? String {
            self.myTextView.text = savedText
        }
    }
    
    func saveInDefaults() {
        if let text = self.myTextView.text {
            self.defaultsMgr.setValue(text, forKey: "userText")
        }
    }
    
    
}

