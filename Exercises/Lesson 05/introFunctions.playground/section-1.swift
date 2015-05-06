
import Foundation

//Defining a Function
func sayHello() {
    println("Hello!")
    //println("ooh, someone looks friendy...")
}

//Call a function -- Tells SWIFT to execute the lines inside the function's "body" (block)
sayHello()

//let isFriendly = true
//if isFriendly {
//   sayHello()
//}

func sayMyName(name:String,age:Int) {
    println("Hello, \(name)! You look good for \(age)!")
}

//sayMyName("Eric",33)

var myName = "Eric"
var myage = 33
sayMyName(myName,myage)

func say(greeting:String,name:String) {
    println("\(greeting), \(name)!")
}

say("Yo","Eric")

func add(numOne:Double,numTwo:Double) -> Double {
    //var sum = numOne + numTwo
    //println("\(numOne) + \(numTwo) = \(sum)")
    //return sum
    return numOne + numTwo
}

var onePlusOne = add(1,1)
var twoPlusTwo = add(2,2)

onePlusOne
twoPlusTwo

onePlusOne + twoPlusTwo

add(onePlusOne,twoPlusTwo)

let milesPerKilometer = 0.62
var kilometers:Int = 5
//var miles = milesPerKilometer * kilometers

func convertKilometersToMiles(kilometers:Double) -> Double {
    //let milesPerKilometer = 0.62
    kilometers
    var miles = milesPerKilometer * kilometers
    return miles
}

kilometers

convertKilometersToMiles(3)

var numberOfCalls = 0

func convertToImperial(what:String, value:Double) -> Double {
    numberOfCalls += 1
    if what == "km" {
        return convertKilometersToMiles(value)
    }
    else {
        return 0.0
    }
}

//convertToImperial("km", 7.0)
//convertToImperial("km", 9.0)
//convertToImperial("km", 11.0)
numberOfCalls
