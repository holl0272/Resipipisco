import Foundation

var optionalInt : Int?
if let _opt = optionalInt {
    "ho"
} else {
    "yak"
}


class Dog {
    var yearBorn : Int?
    
    var age : Int? {
        
        // GETTER!
        // Used for the "object.prop" syntax
        get {
            if let _yearBorn = self.yearBorn {
                return 2015 - _yearBorn
            } else {
                // self.yearBorn was nil!
                return nil
            }
        }
        
        // SETTER!
        // Used for the "object.prop = ..." syntax.
        set (newAge) {
            self.yearBorn = 2015 - newAge!
            self.updateAgeLabel()
        }
    }
    
    func updateAgeLabel() {
        
    }
    
    var name : String
    init(name:String) {
        self.name = name
    }
}

let toshi = Dog(name:"Toshi")
toshi.yearBorn = 2013
toshi.age
toshi.age = 3

toshi.yearBorn
toshi.age










