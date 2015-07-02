import Foundation

func sayHello() {
    println("hello!")
}

sayHello()

func sayHelloWithName(name:String) {
    println("Hello, \(name)")
}
sayHelloWithName("Toshi")

func sayHelloWithTwo(name:String, species:String) {
    println("Hello, \(name). Are you a \(species)?")
}
//sayHelloWithTwo("Toshi", "shiba")
sayHelloWithTwo("Toshi", "shiba")
