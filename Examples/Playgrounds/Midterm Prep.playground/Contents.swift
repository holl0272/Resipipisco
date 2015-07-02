import UIKit

let numberStr = "15"
var number = NSString(string:numberStr).integerValue
number = -number
let newNumberStr = "\(number)"
newNumberStr

// Method 1
// Don't convert to a numeric type (i.e. Double or Int), and
// just add/remove a leading minus sign from the string.
// func toggleMinusSign() {
//    check to see if there's a minus at the start of the input
//    if so: 
//        remove it
//    else:
//         add it


// Method 2
// Hold a boolean as to whether the current value is negated.

// Method 3
// Check to see if there's a decimal point in the input string
// If so, convert to Double
// else, convert to an Int


let welcome = "hello world!"
for char in welcome {
    char
}

var i = advance(welcome.startIndex, 4)
let theO = welcome[i]
theO == "o"

func hasDecimal(str:String) -> Bool {
    let decimal = "."
    let decimalChar = decimal[decimal.startIndex]
    for char in str {
        if decimalChar == char {
            return true
        }
    }
    return false
}

hasDecimal("15.0")


// Testing for inclusion in an NSString
NSString(string:welcome).containsString("wo")
NSString(string:"15.0").containsString(".")


func isDouble(number:String) -> Bool {
    return NSString(string:number).containsString(".")
}

let myInputValue = "15"
if isDouble(myInputValue) {
    let number = NSString(string:myInputValue).doubleValue
    let negated = -number
    println(negated)
} else {
    let number = NSString(string:myInputValue).integerValue
    let negated = -number
    println(negated)
}



// Enumerations

enum ConversionMode {
    case ImperialToMetric
    case MetricToImperial
}

var currentMode : ConversionMode = .MetricToImperial
currentMode == .ImperialToMetric
currentMode == .MetricToImperial

currentMode == ConversionMode.ImperialToMetric
currentMode == ConversionMode.MetricToImperial


enum Units {
    case Feet
    case Meters
    case Ounces
    case Grams
    case Miles
    case Kilometers
}

func isMetric(units:Units) -> Bool {
    switch units {
        case .Feet:
            return false

        case .Meters:
            return true

        default:
            return false
    }
}

isMetric(.Feet)
isMetric(.Meters)




//UIAlertControllerStyle.
let alertView = UIAlertController(
    title:"What's that?!?",
    message: "It's Halley's comet!",
    preferredStyle: .Alert
)


// Tuples

var exampleTuple : (Double, Bool) = (12.0, false)
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
    var name : String
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




enum Key {
    case Plus
    case Minus
    case Times
    case Divide
    case Percent

    case Equals
    
    case Zero
    case One
    case Two
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Dot
}

class Engine {
    
}

class Calculator {
    var engine : Engine!
    
    func calculate() {
        
    }
    
    func getResult() -> Double {
        return -1.0
    }
    
    func type(key:Key) {
        
    }
}

func test(calculator: Calculator, answer:Double, userTyped:[Key]) -> Bool {
    for key in userTyped {
        calculator.type(key)
    }
    
    calculator.calculate()
    
    return answer == calculator.getResult()
}

let myCalc = Calculator()
test(myCalc, 3.0, [.One, .Plus, .Two, .Equals])
test(myCalc, 42.0, [.Four, .Zero, .Plus, .Two, .Equals])




