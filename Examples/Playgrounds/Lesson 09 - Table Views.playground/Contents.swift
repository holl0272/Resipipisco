import Foundation

// () parens, parentheses
// [] brackets
// {} braces
// <> sharps

var someDoubles : [Double] = [1.0]
someDoubles.append(2.0)
someDoubles[0] = 3.0
someDoubles

var someDoubles2 = [2.0, 3.0]

someDoubles.append(someDoubles2[0])
var pi = 3.14
someDoubles.append(pi)

func getE() -> Double {
    return 2.1728
}
someDoubles.append(getE())

// Concatenation
someDoubles + someDoubles2


someDoubles

var sum = 0.0
for el in someDoubles {
    sum += el
}
sum


// DICTIONARIES


var stringsToDoubles : [String:Double] = [:]

// Adds a key-value pair to an existing dictionary
stringsToDoubles["pi"] = 3.14

// Creates a new dictionary
stringsToDoubles = ["e":2.718]

stringsToDoubles.updateValue(3, forKey: "c")
stringsToDoubles



class Person {
    var name : String
    init(name:String) {
        self.name = name
    }
}

class Dog {
    var name : String
    var owner : Person!
    
    init(name:String) {
        self.name = name
    }
}

var mySister = Person(name:"Emily")
var dog = Dog(name:"Layla")
dog.owner
dog.owner = mySister

// Reference to Emily
dog.owner

var dog2 = Dog(name:"Neeko")
dog2.owner = mySister

dog.owner.name
dog2.owner.name

mySister.name = "Emily Key"

dog.owner.name
dog2.owner.name















