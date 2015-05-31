import Foundation

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


class Dog {
    var name :String
    init(name:String) {
        self.name = name
    }
    
    func bark() {
        let message = self.saysWhat()
        println("\(name) says \(message)!")
    }
    
    func saysWhat() -> String {
        return "woof"
    }
}

let toshi = Dog(name:"Toshi")
toshi.bark()