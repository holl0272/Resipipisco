// Intro to Swift in class playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.
    var name:String = "Eric"
    var age:Int = 33

// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"
    println("Hello \(name), you are \(age) years old!")
    
    if(age >= 21) {
        println("You can drink")
    }
    else if(age >= 18) {
        println("you can vote")
    }
    else if(age >= 16) {
        println("You can drive")
    }
    else {
        println("You can't do much, kid")
    }
    
// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    
// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    if(age >= 21) {
        println("you can drive, vote and drink (but not at the same time!)")
    }
    else if((age < 21) && (age >= 18)) {
        println("You can drive and vote")
    }
    else if((age < 18) && (age >= 16)) {
        println("you can drive")
    }
    else {
        println("You can't do much, kid")
    }

// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)
    for(var i=1; i<=50; i++) {
        println((7*i)-1)
    }

// TODO: Create a constant called number
    let number:Int = 33

// TODO: Print whether the above number is even
    number%2 == 0

// TODO: Print whether the above number is a multiple of three
    number%3 == 0

// TODO : Create a variable "sevens". Initialize it with 0. Increment that variuable by seven seven times (use different syntaxes for incrementing).
    var sevens:Double = 0
    sevens += 7
    sevens = sevens * 2
    sevens = sevens + (sevens/2)
    sevens += 7.0
    sevens = sevens + 7.0
    sevens = (sevens/5) * ((sevens/5) - 1)
    sevens = sevens + 7

// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()
    println("Hello \(name), your name is \(countElements(name)) characters long!")

// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.
    var randomNumberSum:UInt32 = 0
    for(var i=0; i<100; i++) {
        randomNumberSum += arc4random_uniform(100)+1 //random number, 1 through 100
    }
    println(randomNumberSum)

// Bonus TO DO: Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.
    
    for(var i=1; i<=100; i++) {
        if((i % 3 == 0) && (i % 5 != 0)) {
            println("Fizz")
        }
        else if((i % 3 != 0) && (i % 5 == 0)) {
            println("Buzz")
        }
        else if((i % 3 == 0) && (i % 5 == 0)) {
            println("FizzBuzz")
        }
        else {
            println(i)
        }
    }

// BONUS TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below

    var fibonacci = 0
    var x = 0
    var y = 1

    for(var i=0; i<36; i++) {
        fibonacci = x + y
        x = y
        y = fibonacci
    }
    
    println(fibonacci)


