//
//  DataManager.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/3/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import Foundation

class DataManager {
    var contacts: [String:[String]]
    
    init() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let contactInfo = userDefaults.valueForKey("contacts") as? [String:[String]] {
            contacts = contactInfo
        } else {
            // add default data
            contacts = [
                "Birds": ["Swift"],
                "Cats" : ["Persian Cat"],
                "Dogs" : ["Labrador Retriever"]
            ]
        }
    }
    
    var contactsList: [String] {
        var list: [String] = []
        for contactName in contacts.keys {
            list.append(contactName)
        }
        
        list.sort(<)
        
        return list
    }
    
    struct Static {
        static var onceToken : dispatch_once_t = 0
        static var instance : DataManager? = nil
    }
    
    class var sharedInstance : DataManager {
        dispatch_once(&Static.onceToken) {
            Static.instance = DataManager()
        }
        return Static.instance!
    }
}