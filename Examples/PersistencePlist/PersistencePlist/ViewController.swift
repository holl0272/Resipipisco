//
//  ViewController.swift
//  PersistencePlist
//
//  Created by William Martin on 6/8/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func onSaveTapped(sender: AnyObject) {
        self.saveToPlist()
    }
    
    @IBOutlet weak var myTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let saved = NSDictionary(contentsOfURL: self.propertyListUrl)
        self.myTextView.text = "\(saved)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    lazy var documentsDirectory: NSURL = {
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls.first as! NSURL
    }()
    
    lazy var propertyListUrl: NSURL = {
        return self.documentsDirectory.URLByAppendingPathComponent("myPropertyList.plist", isDirectory: false)
    }()
    
    func saveToPlist() {
        // The idea here is to construct a data structure that can be saved in one operation.
        
//        let numbers: NSArray = [1.0, 1.0, 2.0, 3.0, 5.0]
//        numbers.writeToURL(self.propertyListUrl, atomically: true)
        
        let dict: NSDictionary = [
            "textview_contents": self.myTextView.text,
            "favorite_numbers": [1.0, 1.0, 2.0, 3.0, 5.0]
        ]
        dict.writeToURL(self.propertyListUrl, atomically: true)
    }
}

