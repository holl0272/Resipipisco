import Foundation


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
    
    case Clear
    case ClearAll
}

enum Operation {
    case None
    
    case Addition
    case Subtraction
    case Multiplication
    case Division
    case Percentage
}

let operationForKey : [Key: Operation] = [
    .Plus : .Addition,
    .Minus : .Subtraction,
    .Times : .Multiplication,
    .Divide : .Division
]

let digitForKey : [Key: String] = [
    .Zero : "0",
    .One : "1",
    .Two : "2",
    .Three : "3",
    .Four : "4",
    .Five : "5",
    .Six : "6",
    .Seven : "7",
    .Eight : "8",
    .Nine : "9",
    .Dot : "."
]

class Engine {
    var left : Double? = 0.0
    var op : Operation? = nil
    var right : Double? = nil
    
    var isSettingLeft : Bool = true
    
    func clear() {
        if self.isSettingLeft {
            self.left = nil
        } else {
            self.right = nil
        }
    }
    
    func clearAll() {
        self.left = 0.0
        self.op = nil
        self.right = nil
        self.isSettingLeft = true
    }
    
    func pushInput(input:String) {
        let value = NSString(string:input).doubleValue
        if self.isSettingLeft {
            self.left = value
        } else {
            self.right = value
        }
    }
    
    func pushOperation(operation:Operation?) {
        if let _op = self.op {
            self.calculate()
        }
        
        self.op = operation
        self.isSettingLeft = false
    }
    
    func calculate() {

        if let _left = self.left {
            if let _right = self.right {
                if let _op = self.op {
                    
                    let result = self.calculate(
                        _left,
                        operation: _op,
                        rightOperand: _right
                    )
                    
                    if let _result = result {
                        left = _result
                    } else {
                        // ERROR!
                        left = nil
                    }
                    
                }
            }
        }

    }
    
    func calculate(leftOperand:Double, operation:Operation, rightOperand:Double) -> Double? {

        switch operation {
        case .Addition:
            return leftOperand + rightOperand
            
        case .Subtraction:
            return leftOperand - rightOperand

        case .Multiplication:
            return leftOperand * rightOperand

        case .Division:
            if rightOperand == 0 {
                return nil
            }
            return leftOperand / rightOperand

        default:
            return nil
        }
    }
    
    func calculatePercentage() {
        if let _left = left {
            if let _right = right {
                right = _left * _right / 100.0
            }
        }
    }
}

class Calculator {
    // The calculation engine.
    var engine : Engine!
    
    // State
//    var didPressEquals : Bool = false
    var input : String? = nil
    
    init() {
        self.engine = Engine()
    }
    
    func calculate() {
        if let _input = self.input {
            self.engine.pushInput(_input)
        }
        self.engine.calculate()
    }
    
    func clearAll() {
//        self.didPressEquals = false
        self.input = nil
        
        self.engine.clearAll()
    }
    
    func clear() {
        self.input = ""
        self.engine.clear()
    }
    
    func getResult() -> Double? {
        return self.engine.left
    }

    func type(key:Key) {
        if key == .Equals {
//            self.didPressEquals = true
            self.calculate()
        
        } else if key == .Clear {
            self.clear()
        
        } else if key == .ClearAll {
            self.clearAll()

        } else if isOperation(key) {

            // Enables chaining operations.
//            if !self.didPressEquals {
//                self.calculate()
//            } else {
//                self.didPressEquals = false
//            }
            
            self.engine.pushOperation(operationForKey[key])
            self.input = nil

        } else if key == .Percent {
            if let _input = self.input {
                self.engine.pushInput(_input)
            }
            
            self.engine.calculatePercentage()
            self.input = nil

        } else {
            if let digit = digitForKey[key] {
                if self.input == nil {
                    self.input = ""
                }
                self.input! += digit

            }
        }
    }
    
    func isOperation(key:Key) -> Bool {
        return operationForKey[key] != nil
    }
}

func test(calculator: Calculator, expectedAnswer:Double?, userTyped:[Key]) -> Bool {
    calculator.clearAll()
    
    for key in userTyped {
        calculator.type(key)
    }
    
    let computedAnswer = calculator.getResult()
    if let _computedAnswer = computedAnswer {
        return expectedAnswer == _computedAnswer
    } else {
        return expectedAnswer == computedAnswer
    }
}


let myCalc = Calculator()

// Simple, base calculation.
test(myCalc, 3.0, [.One, .Plus, .Two, .Equals])

// Type multiple digits
test(myCalc, 42.0, [.Four, .Zero, .Plus, .Two, .Equals])
test(myCalc, 46.0, [.One, .Two, .Plus, .Three, .Four, .Equals])
test(myCalc, 2.1, [.One, .Dot, .One, .Plus, .One, .Equals])

// Equals should repeat the last calc.
test(myCalc, 5.0, [.One, .Plus, .Two, .Equals, .Equals])

// A new calculation based on the last result.
test(myCalc, 44.0, [.Four, .Zero, .Plus, .Two, .Equals, .Plus, .Two, .Equals])
// Implicit equals when chaining operations together.
test(myCalc, 20.0, [.Two, .Zero, .Plus, .Five, .Minus, .Five, .Equals])
// Should enable correcting the operation.
test(myCalc, 6.0, [.Two, .Plus, .Divide, .Minus, .Times, .Three, .Equals])

// Percentage operation.
test(myCalc, 224.0, [.Two, .Zero, .Zero, .Plus, .One, .Two, .Percent, .Equals])

// Testing clearing values.
test(myCalc, 3.0, [.Five, .Clear, .One, .Plus, .Two, .Equals])
test(myCalc, 3.0, [.One, .Plus, .Five, .Clear, .Two, .Equals])
test(myCalc, 3.0, [.Five, .Plus, .Five, .ClearAll, .One, .Plus, .Two, .Equals])

// Testing erroneous calcs.
test(myCalc, nil, [.One, .Divide, .Zero, .Equals])


