import Foundation


func sayHello(name:String) {
    println("Hello! \(name)")
}

sayHello("Toshi")
sayHello("Layla")


func say(greeting:String, name:String) {
    println("\(greeting)!!!!!! \(name)")
}

say("Wassup", "Toshi")
say("Hello", "Layla")
say("Bye", "Neeko")



func add(firstNumber:Double, secondNumber:Double) -> Double {
    return firstNumber + secondNumber
}

add(1.0, 2.0)
add(5.7, 2.3)

var onePlusOne = add(1.0, 1.0)
var twoPlusTwo = add(2.0, 2.0)

onePlusOne
twoPlusTwo

onePlusOne + twoPlusTwo



//let milesPerKilometer = 0.62
//var kilometers : Double = 5
//var miles = milesPerKilometer * kilometers

let milesPerKilometer = 0.62

func convertKilometersToMiles(kilometers:Double) -> Double {
    let miles = milesPerKilometer * kilometers
    return miles
}


convertKilometersToMiles(5.0)
convertKilometersToMiles(10.0)
convertKilometersToMiles(384400.0)
convertKilometersToMiles(20.0)


var numberOfCalls = 0
//var numberOfCalls = 0    // no no no no no!

func convertToImperial(what:String, value:Double) -> Double {
//    var numberOfCalls = 0
    numberOfCalls += 1
    
    if what == "km" {
        return convertKilometersToMiles(value)
    } else {
        return 0.0
    }
}

convertToImperial("km", 7.0)
convertToImperial("km", 9.0)
convertToImperial("km", 11.0)

if numberOfCalls != 3 {
    println("crap!")
}








