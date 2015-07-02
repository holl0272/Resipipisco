//: Playground - noun: a place where people can play

import Foundation

1 + 1
3.14159

//45000 * 24 / 100

var salary = 30000.0
var taxRate = 0.24

let incomePerYear = salary * (1.0 - taxRate)

let monthsPerYear = 12.0

let incomePerMonth = incomePerYear / monthsPerYear

var rent = -800.0
var electric = -80.0
var cellPhone = -300.0
var studentLoans = -140.0
var monthlyBurn = -500.0

incomePerMonth + rent + electric + cellPhone + studentLoans + monthlyBurn




let feetPerMeter = 3.28
let footballFieldLength = 300.0
println(footballFieldLength / feetPerMeter)






let temp = 400
temp <= 32

// Conditional statement == if-statement == if-else statement

if temp <= 32 {
    println("freezing!")
} else if temp >= 212 {
    println("boiling!")
} else {
    println("liquid!")
}

// Write a conditional statement with 4-5 clauses that print
// what you would wear given a particular temperature.

//32 <= temp && temp < 212
//let isUncomfortable = temp > 110 || temp < 20
//isUncomfortable


let currentTemp = 55

if currentTemp > 80 {
    println("nothing")
} else if currentTemp > 70 {
    println("shorts")
} else if currentTemp > 60 {
    println("light jacket")
} else if currentTemp > 50 {
    println("sweater")
} else if currentTemp > 40 {
    println("coat")
} else {
    println("parka")
}




// Loops


var x = 0
var sum = 0

0 <= 20
2 <= 20
4 <= 20
// ...
18 <= 20
20 <= 20
22 <= 20

while x <= 20 {
    sum = sum + x
    x = x + 2         // Add one to x
}
println(sum)

0 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9
0 + 2 + 4 + 6 + 8 + 10 + 12 + 14 + 16 + 18 + 20





for (var temp = 0; temp < 300; temp += 5) {
    
    if temp <= 32 {
        println("freezing!")
    } else if temp >= 212 {
        println("boiling! \(temp)")
        break
    } else {
        println("liquid!")
    }
    
}
// break takes us here.

4 % 1
4 % 2
4 % 3
4 % 4

var isPrime = true
let isItPrime = 239
for (var i = 2; i < isItPrime; i++) {
    let isEven = i % 2 == 0
    let isGreaterThanTwo = i > 2
    if isEven && isGreaterThanTwo {
        continue     // skip the rest of the block, but keep going
    }
    
    println(i)
    
    if isItPrime % i == 0 {
        println("composite! \(i)")
        isPrime = false
        break      // STOP EVERYTHING!
    }
}
println(isPrime)





// OPTIONALS


var name : String?
name
name == nil

name = "Toshi"
println(name)

name
name!
name! + " the Shiba"
name + " the Shiba"















