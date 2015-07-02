
import Foundation


class Dog {
    var name : String
    
    init(name:String) {
        self.name = name
        println("Here I am!")
    }
    
    func bark(){
        println("Woof!")
    }
}

var toshi = Dog(name:"Toshi")
toshi.bark()
toshi.name
