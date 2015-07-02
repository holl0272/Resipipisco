
import Foundation


let milesPerKilometer = 0.62
var kilometers : Double = 5   // or just say 5.0

// interpolation:
println("\(milesPerKilometer) * \(kilometers)")

var miles = milesPerKilometer * kilometers



miles = 1.0

while miles >= 1.0 && miles <= 50.0 {

    if miles < 2 {
        println("i'm ok")
    } else if miles >= 2 && miles < 3 {
        println("you still can doooo it!")
    } else if miles >= 3 {
        println("feel like shit")
    }

miles += 1
}

for (var mi = 1.0; mi >= 1.0 && mi <= 50.0; mi += 1) {
    println("hi")
}


// for-in syntax (for-each)

// range 0 to 10 "inclusive" == include the number 10
for x in 5...10 {
    x
}

// range 0 to 10 "exclusive"
for y in 0..<10 {
    y
}












