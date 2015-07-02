import Foundation


// Array of strings.
var arr = [String]()
arr += ["hello"]
arr.append("doctor")
arr = arr + ["continue", "yesterday"]

sort(&arr)
arr.insert("tomorrow", atIndex: 0)
arr


// Array initialized with multiple types. Becomes an array of [AnyObject]
var arr2 = [1, "hello", 2.3]
arr2

var arr3 = ["hello", "doctor", "name", "continue", "yesterday", "tomorrow"]
arr3.removeAtIndex(3)
arr3


// An array of objects
class Dog {
    var name : String
    var gender : String
    
    init(name:String, gender:String) {
        self.name = name
        self.gender = gender
    }
    
    func bark() -> String {
        return "\(self.name) says woof!"
    }
}

// An array to hold some dogs
var dogs : [Dog] = []

// Let's make some dogs!
let myDog = Dog(name:"Toshi", gender:"m")
dogs.append(myDog)

let mySistersDog = Dog(name:"Layla", gender:"f")
dogs.append(mySistersDog)

let mySistersOtherDog = Dog(name:"Neeko", gender:"m")
dogs.append(mySistersOtherDog)

// How many dogs do we have again?
count(dogs)
let reversedDogs = dogs.reverse()
reversedDogs

dogs  // Didn't change!


// Let's sort the dogs by name.
func sortByName(a:Dog, b:Dog) -> Bool {
    return a.name < b.name
}

dogs.sort(sortByName)
dogs  // Changed!

// Given a dog, return whether it's male or not.
func isMale(dog:Dog) -> Bool {
    return dog.gender == "m"
}
let maleDogs = dogs.filter(isMale)
count(maleDogs)
count(dogs)


// Let's organize this into a class.

class DogCollection {
    var dogs : [Dog] = []
    init() {
    }
    
    func addDog(dog:Dog) {
        self.dogs.append(dog)
    }
    
    func numberOfDogs() -> Int {
        return count(self.dogs)
    }
    
    func sortMyDogs() {
        func sortByName(a:Dog, b:Dog) -> Bool {
            return a.name < b.name
        }
        self.dogs.sort(sortByName)
    }
    
    func getDog(name:String) -> Dog? {
        for dog in self.dogs {
            if dog.name == name {
                return dog
            }
        }
        return nil
    }
}


// Ok, let's use this collection class.

let myFamilysDogs = DogCollection()
myFamilysDogs.addDog(myDog)
myFamilysDogs.addDog(mySistersDog)
myFamilysDogs.addDog(mySistersOtherDog)
myFamilysDogs.addDog(Dog(name:"Sandy", gender:"f"))
myFamilysDogs.addDog(Dog(name:"Betsy", gender:"f"))

myFamilysDogs.numberOfDogs()

// Note that the argument name: isn't required!!!!!
let toshi = myFamilysDogs.getDog("Toshi")
if let _toshi = toshi {
    _toshi.name
}

myFamilysDogs.sortMyDogs()
for dog in myFamilysDogs.dogs {
    dog.name
}


// Make a Dictionary of mathematical and physical constants.

var constants = [String: Double]()
constants["e"] = 2.71828
constants["pi"] = 3.14159
constants["e"]

//constants.removeValueForKey("e")
//constants


var s = 0.0
for (constant, value) in constants {
    s += value
}
s

















