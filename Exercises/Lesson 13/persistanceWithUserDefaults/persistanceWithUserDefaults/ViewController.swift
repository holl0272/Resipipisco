//
//  ViewController.swift
//  persistanceWithUserDefaults
//
//  Created by Eric Holland on 6/9/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var namesArray = [String]()
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func onSavedTapped(sender: AnyObject) {
        //self.saveToPlist()
        
        var name = self.myTextField.text!
        
        self.namesArray.append(name)
        
        println("save: \(self.namesArray)")
        
        self.saveInDefaults()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.loadFromPlist()

        self.loadFromDefaults()
    }
    
//    func getPropertyListUrl() -> NSURL {
//        let fileMgr = NSFileManager.defaultManager()
//        
//        let urls = fileMgr.URLsForDirectory(
//            .DocumentDirectory,
//            inDomains: .UserDomainMask
//        )
//        
//        let documentsDirectory = urls.first as! NSURL
//        
//        let myPlist = documentsDirectory.URLByAppendingPathComponent(
//            "myFirstPropertyList.plist",
//            isDirectory: false
//        )
//        
//        return myPlist
//    }
//    
//    func saveToPlist() {
//        let dataToSave: NSDictionary = [
//            "textview_contents": self.myTextView.text,
//            "favorite_numbers": [3.14159, 2.71828, 1.618, 0.0],
//            "age": 36
//        ]
//        
//        dataToSave.writeToURL(self.getPropertyListUrl(), atomically: true)
//    }
//    
//    func loadFromPlist() {
//        let savedData = NSDictionary(contentsOfURL: self.getPropertyListUrl())
//        println(savedData)
//    }
//    
//    
//    func saveToFlatFile() {
//        let textToSave = self.myTextView.text
//        
//        //NSString(string: textToSave).writeToURL(<#url: NSURL#>, atomically: <#Bool#>, encoding: <#UInt#>, error: <#NSErrorPointer#>)
//    }
    
    
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    func saveInDefaults() {
        //self.namesArray.removeAll()
        let add_name_to_array = self.namesArray
        self.defaultsMgr.setValue(add_name_to_array, forKey:"userText")
    }
    
    func loadFromDefaults() {
        if let savedText = self.defaultsMgr.valueForKey("userText") as? [String] {
            self.namesArray = savedText
            println("init: \(self.namesArray)")
            let stringRepresentation = "-".join(savedText)
            self.myTextView.text = stringRepresentation
        }
    }
    
}

