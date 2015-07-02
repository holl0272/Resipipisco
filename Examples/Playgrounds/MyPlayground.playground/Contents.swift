
import Foundation


var name : String?
name = "Toshi"
println(name)
//name = nil

if let _name = name {
    println(_name)
    println("Not nil! I have a String: \(_name)")
} else {
    println("nil!")
}







