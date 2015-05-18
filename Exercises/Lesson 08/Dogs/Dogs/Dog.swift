//
//  Dog.swift
//  Dogs
//
//  Created by Eric Holland on 5/14/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import Foundation

class Dog {
    var name : String
    var breed : String?
    var color : String?
    var age : String?
    var sex : String?
    var weight : String?
    var height : String?
    var barkSound : String?
    
    init(name:String,breed:String,color:String,age:String,sex:String,weight:String,height:String,barkSound:String) {
        self.name = name
        self.breed = breed
        self.color = color
        self.age = age
        self.sex = sex
        self.weight = weight
        self.height = height
        self.barkSound = barkSound
    }
    
    func bark() -> String {
        return "\(self.name) says \(self.barkSound)!"
    }
}
