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
    
    func saveData() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(contacts, forKey: "contacts")
    }
    
    func addContactInfo(conatcts inContacts: String, info: String) {
        if var contactInfo = contacts[inContacts] {
            contactInfo.append(info)
            contacts[inContacts] = contactInfo
        }
        
        saveData()
    }
    
    func removeRace(contacts inContacts: String, info inInfo: String) {
        if var contactInfo = contacts[inContacts] {
            var index = -1
            
            for (idx, info) in enumerate(contactInfo) {
                if info == inInfo {
                    index = idx
                    break
                }
            }
            
            if index != -1 {
                contactInfo.removeAtIndex(index)
                contacts[inContacts] = contactInfo
                saveData()
            }
            
        }
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