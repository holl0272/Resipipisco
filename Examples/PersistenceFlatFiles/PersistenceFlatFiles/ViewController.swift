//
//  ViewController.swift
//  PersistenceFlatFiles
//
//  Created by William Martin on 6/8/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTextView: UITextView!
    @IBAction func onSaveTapped(sender: AnyObject) {
        self.saveTextToFile()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    func getUrlForDocument(documentName: String) -> NSURL {
        return self.documentsDirectory.URLByAppendingPathComponent(documentName, isDirectory: false)
    }
    
    func saveTextToFile() {
        let textFile = "myText.txt"
        let textFileUrl = self.getUrlForDocument(textFile)
        
        // Grab the text and save
        let textToSave: NSString = self.myTextView.text
        textToSave.writeToURL(textFileUrl, atomically: false, encoding: NSStringEncodingConversionOptions.AllowLossy, error: nil)
    }
}

