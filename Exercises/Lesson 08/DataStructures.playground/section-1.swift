import Foundation

//Explicit type, empty array
var arr : [String] = []

//Implicit type, empty array
var arr1 = [String]()

//Implicit type, non-empty
var arr2 = ["hello", "doctor"]

arr2[0]
arr2[1]

//Out of Bounds
//arr2[2]

//Get the number of elements in an array
//count(arr2) <-- this is the same as countElements
countElements(arr2)

//Append an element to the end of an array
arr2.append("name")
arr2

//Concatenate two arrays
arr2 += ["continue", "yesterday"]
arr2

//Inset an element at the front of an array
arr2.insert("tomorrow", atIndex:0)
arr2

//Change an element of an array
arr2[0] = "discovery"
arr2
countElements(arr2)

//Remove an element from an array
arr2.removeAtIndex(3)
arr2

var all = ""
for word in arr2 {
    all += word
}
all

var sum = 0
for (index, word) in enumerate(arr2) {
    sum += index
}
sum

//Sorting using sort(). Works for basiuc types.
arr2
sort(&arr2) //note the & allows the array to be changed
arr2

//Better Sorting
arr2
func alphabetical(a:String, b:String) -> Bool {
    return a < b
}
arr2.sort(alphabetical)

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

var dogs : [Dog] = []

let myDog = Dog(name: "Tycoon")

dogs.append(myDog)
dogs

countElements(dogs)
dogs[0].name


//DICTIONARIES!!!

//Empty Dictonary "from String to Value"
//type of the keys = Strings
//type of the values = Double

var constants : [String:Double] = [:]
constants["e"] = 2.71828
constants["pi"] = 3.14159
constants

constants["pi"]


