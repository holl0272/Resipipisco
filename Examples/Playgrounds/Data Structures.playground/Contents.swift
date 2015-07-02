import Foundation

// Explicit type, empty array
var arr : [String] = []

// Implicit type, empty array
var arr1 = [String]()

// Implicit type, non-empty
var arr2 = ["hello", "doctor"]

arr2[0]
arr2[1]

// Error: "Out of bounds"
//arr2[2]

// Get the number of elements in an array.
count(arr2)
// Should also work for "older" versions.
//countElements(arr2)

// Append an element to the end of an array.
arr2.append("name")
arr2

// Concatenate two arrays
arr2 = arr2 + ["continue", "yesterday"]

// Insert an element at the front of an array.
arr2.insert("tomorrow", atIndex:0)
arr2

// Change an element of an array.
arr2[0] = "discovery"
arr2
count(arr2)

// Remove an element from an array
arr2.removeAtIndex(3)
arr2
count(arr2)

// Iterate over arrays...

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


// Sorting using sort(). Works for basic types.
arr2
//sort(&arr2)    // note the &
//arr2

// Better sorting.
arr2
func alphabetical(a:String, b:String) -> Bool {
    return a > b
}
arr2.sort(alphabetical)

var numbers = [5,4,2,1,7,6,3,8]
func increasing(a:Int, b:Int) -> Bool {
    return a < b
}
numbers.sort(increasing)

func decreasing(a:Int, b:Int) -> Bool {
    return a > b
}
numbers.sort(decreasing)



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

let myDog = Dog(name:"Toshi")
dogs.append(myDog)
dogs

count(dogs)
dogs[0].name



// DICTIONARIES!!!!

// Empty dictionary "from String to Double"
// type of the keys = String
// type of the values = Double
var constants : [String: Double] = [:]

constants["e"] = 2.71828
constants["pi"] = 3.14159
constants["c"] = 299792458
constants







