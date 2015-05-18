// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//how many meters is a football field?
let feetPerMeter = 3.28
let footballFieldLength = 300.0
println(footballFieldLength / feetPerMeter)

//temperature
let temp : Int = 50
var clothing : String = ""

if temp <= 32 {
    clothing = "parka"
}
else if 32 <= temp && temp < 50 {
    clothing = "coat"
}
else if 50 >= temp && temp < 60 {
    clothing = "jacket"
}
else if 60 >= temp && temp < 70 {
    clothing = "sweater"
}
else if 70 >= temp && temp < 80 {
    clothing = "t-shirt"
}
else {
    clothing = "tank-top"
}

println("When it's \(temp) degrees, I'm wearing a \(clothing).")


//loops
var x = 0
var sumX = 0
while x < 10 {
    sumX = sumX + x
    x++
}
println(sumX)

var y = 0
var sumY = 0
while y <= 20 {
    sumY = sumY + x
    y += 2
}
println(sumY)

//for loop
for (var temp = 0; temp < 100; temp += 5) {
    if temp <= 32 {
        println("parka")
    }
    else if 32 <= temp && temp < 50 {
        println("coat")
    }
    else if 50 >= temp && temp < 60 {
        println("jacket")
    }
    else if 60 >= temp && temp < 70 {
        println("sweater")
    }
    else if 70 >= temp && temp < 80 {
        println("t-shirt")
    }
    else {
        println("tank-top")
    }
}

//break
for (var temp = 0; temp < 300; temp += 5) {
    if temp <= 32 {
        println("freezing!")
    }
    else if temp >= 212 {
        println("boiling!")
        break
    }
    else {
        println("liquid!")
    }
}

//continue
let isItPrime = 289
for (var i = 2; i < isItPrime; i++) {
    if i % 2 == 0 && i > 2 {
        continue //we don't need to check even numbers after 2 so continue with the next iteration
    }
    println(i)
    if isItPrime % i == 0 {
        println("composite at \(i)")
        break //stop the loop b/c this iteration found a divisor
    }
}

//for-in syntax (for-each)
for x in 0...10 { //inclusive 0 to 10 == include the number 10
    println(x)
}

for y in 0..<10 { //exclusive 0 to 10 == doesn't include number 10
    print(y)
}

//optionals
var name : String?
name = "Eric"
//println(name)

//name = nil

if let _name = name {
    println(_name)
    println("Not nil! I have a string: \(_name)")
}
else {
    println("nil!")
}

