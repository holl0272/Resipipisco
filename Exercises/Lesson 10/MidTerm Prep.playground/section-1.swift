import Foundation

class Dog {
    var yearBorn : Int?
    
    var age : Int? {
        
        //Getter
        //Used for the "object.prop" syntax
        get {
            if let _yearBorn = self.yearBorn {
                return 2015 - _yearBorn
            }
            else {
                return nil
            }
        }
        
        //Setter
        //Used for the "object.prop = ..." syntax
        set (newAge) {
            self.yearBorn = 2015 - newAge!
            self.updateAgeLabel()
        }
    }
    
    func updateAgeLabel() {
        
    }
    
    var name : String
    init(name:String) {
        self.name = name
    }
}

let tycoon = Dog(name:"Tycoon")
tycoon.name

tycoon.yearBorn = 2013
tycoon.age

tycoon.age = 3
tycoon.yearBorn
tycoon.age

//Enumerations

enum ConversionMode {
    case ImperialToMetric
    case MetricToImperial
}

var currentMode : ConversionMode = .ImperialToMetric

currentMode == .ImperialToMetric
currentMode == .MetricToImperial

currentMode == ConversionMode.ImperialToMetric
currentMode == ConversionMode.MetricToImperial

enum Units {
    case Feet
    case Meters
    case Grams
    case Miles
    case Kilometers
}

func isMetric(units:Units) -> Bool {
    switch units {
        case .Meters:
            return true
        default:
            return false
    }
}

isMetric(.Feet)
isMetric(.Meters)



//Tuples

let exampleTuple : (Double, Bool) = (12.0, false)

exampleTuple.0
exampleTuple.1

var unitsTuple : (units:Units, isMetric:Bool) = (units:.Feet, isMetric:false)

unitsTuple.units
unitsTuple.isMetric

func divide(x:Int, y:Int) -> (answer:Int, remainder:Int) {
    let answer = x / y
    let remainder = x % y
    return (answer:answer, remainder:remainder)
}

let sample = divide(100, 33)
sample.answer
sample.remainder


class Cat {
    var name :String
    init(name:String) {
        self.name = name
    }
    
    func pur() {
        let message = self.saysWhat()
        println("\(name) says \(message)!")
    }
    
    func saysWhat() -> String {
        return "me-ow"
    }
}

let toshi = Cat(name:"Toshi")
toshi.pur()
