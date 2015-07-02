//
//  Dog.swift
//  Dogs
//
//  Created by William Martin on 5/14/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import Foundation

class Dog {
    var name : String
    var age : Int?
    
    init(name:String) {
        self.name = name
    }
    
    func bark() -> String {
        return "\(self.name) says woof!"
    }
}

