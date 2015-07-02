//
//  ViewController.swift
//  PersistWithUserDefaults
//
//  Created by William Martin on 6/9/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTextView: UITextView!

    @IBAction func onSaveTapped(sender: AnyObject) {
//        self.saveInDefaults()
        self.saveToPlist()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.loadFromDefaults()
        self.loadFromPlist()
    }

    
    func getUrlForDocument(filename: String) -> NSURL {
        let fileMgr = NSFileManager.defaultManager()

        let urls = fileMgr.URLsForDirectory(
            .DocumentDirectory,
            inDomains: .UserDomainMask
        )
        
        let documentsDirectory = urls.first as! NSURL
        
        let fileUrl = documentsDirectory.URLByAppendingPathComponent(
            filename,
            isDirectory: false
        )
        
        return fileUrl
    }
    
    
    func loadFromTextFile() {
        let url = self.getUrlForDocument("myText.txt")
        let savedText = NSString(
            contentsOfURL: url,
            encoding: NSUTF8StringEncoding,
            error: nil
        )
        
    }
    
    func saveToTextFile() {
        let textFileUrl = self.getUrlForDocument("myText.txt")
        
        // Grab the text and save
        let textToSave: NSString = self.myTextView.text
        textToSave.writeToURL(
            textFileUrl,
            atomically: false,
            encoding: NSUTF8StringEncoding,
            error: nil
        )
    }
    
    
    func saveToPlist() {
        let dataToSave: NSDictionary = [
            "textview_contents": self.myTextView.text,
            "favorite_numbers": [3.14159, 2.71828, 1.618, 0.0],
            "age": 36
        ]
        
        let url = self.getUrlForDocument("myFirstPropertyList.plist")
        dataToSave.writeToURL(url, atomically: true)
    }
    
    func loadFromPlist() {
        let url = self.getUrlForDocument("myFirstPropertyList.plist")
        let savedData = NSDictionary(contentsOfURL: url) as? [String:AnyObject]
        if let _savedData = savedData {
            println(_savedData)
        }
    }
    
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    func saveInDefaults() {
        let text = self.myTextView.text
        self.defaultsMgr.setValue(text, forKey:"userText")
        self.defaultsMgr.setValue([1,2,3,4,5], forKey:"myNumbers")
    }
    
    func loadFromDefaults() {
        if let savedText = self.defaultsMgr.valueForKey("userText") as? String {
            self.myTextView.text = savedText
        }
    }
}












