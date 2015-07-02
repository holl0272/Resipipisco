import Foundation

class Person {
    var name : String
    init(name:String) {
        self.name = name
    }
}

class Dog {
    var name : String
    var age : Int?
    var owner : Person = Person(name:"john")
    
    init(name:String) {
        self.name = name
    }
    
    init(name:String, yearBorn:Int) {
        self.name = name
        let currentYear = 2015
        self.age = currentYear - yearBorn
    }
    
    func bark() -> String {
        return "\(self.name) says BARK!"
    }
}


var myDog = Dog(name:"Toshi", yearBorn:2013)
// Access a property using "dot notation"
myDog.name
// Access a method using "dot notation"
myDog.bark()
myDog.owner.name
myDog.owner.name = "jane"
myDog.owner.name
myDog.age



var mySistersDog = Dog(name:"Layla")
mySistersDog.name

var mySister = Person(name:"Emily")
mySistersDog.owner = mySister
mySistersDog.owner.name

var mySistersOtherDog = Dog(name:"Neeko")
mySistersOtherDog.owner = mySister
mySistersOtherDog.owner.name


mySister.name = "Norma"
mySistersDog.owner.name
mySistersOtherDog.owner.name




class Shiba : Dog {
    override func bark() -> String {
        return "Shibas don't bark."
    }
}

var anotherDog = Shiba(name:"Kuma")
anotherDog.name
anotherDog.bark()


let numberAsString = "3.14"
// How to convert this into a Double?????
let double = NSString(string:numberAsString).doubleValue

double
double + 1.0










