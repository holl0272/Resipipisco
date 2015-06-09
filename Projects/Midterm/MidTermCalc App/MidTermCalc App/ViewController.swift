//
//  ViewController.swift
//  MidTermCalc App
//
//  Created by Eric Holland on 6/1/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var inputValue : String = ""
    enum InputState {
        case Positive
        case Negative
    }
    //init positive state for inputValue
    var currentInputState : InputState = .Positive
    
    var tempValue : String = ""
    var memoryValue : String = ""

    var blankValue : String = ""
    var zeroValue : String = "0"
    
    var dupValues : Bool = false
    
    @IBOutlet weak var calcInit: UILabel!
    @IBOutlet weak var operationSign: UILabel!

    @IBOutlet weak var displayValue: UILabel!
    @IBOutlet weak var tempDisplayValue: UILabel!
    @IBOutlet weak var memoryDisplayValue: UILabel!
    
    @IBAction func onButtonPressed(sender:UIButton) {
        
        //set button
        let buttonText = sender.titleLabel!.text!
        
        //zero out inputValue to prep calculation
        if((self.inputValue == self.zeroValue) || (self.inputValue == self.tempValue)) {
            self.inputValue = self.blankValue
        }
        
        //force double value
        if(self.inputValue == "0."){
            self.calcInit.text! = "1"
        }
        
        //override init for clear buttons
        if((self.calcInit.text! == "1") && ((buttonText == "C") || (buttonText == "AC"))) {
            self.calcInit.text! = self.zeroValue
        }
        
        //assign enumerate on evaluation
        if(self.inputValue.rangeOfString("-") != nil){
            self.currentInputState = .Negative
        }
        
        //clear inputValue of error if one exists
        if(self.inputValue == "Error") {
            self.inputValue = self.blankValue
        }
        
        //check button type, returns true if digit
        let numericButton = checkButtonType(buttonText)
        
        if(numericButton) {
            
            //handle multi instances of decimal button
            if(buttonText == ".") {

                //check for decimal instance
                var hasDecimal = self.displayValue.text!.rangeOfString(".")
                
                //display has instance
                if(hasDecimal != nil) {
                    
                    //calc valueOne is a double
                    if(self.operationSign.text! == self.blankValue) {
                        return
                    }
                    //calc valueTwo is a double
                    else if(self.displayValue.text! != self.tempDisplayValue.text!) {
                        return
                    }
                }
            }
            
            //no opperation set
            if(self.operationSign.text! == self.blankValue) {
                
                //handle 0 as first digit clicked
                if((self.inputValue == self.blankValue) && (buttonText == self.zeroValue)) {
                    return
                }
                
                //handle decimal as first digit clicked
                if((self.inputValue == self.blankValue) && (buttonText == ".")) {
                    self.inputValue = "0."
                }
                else if(self.inputValue == self.blankValue) {
                    self.inputValue = buttonText
                }
                else {
                    self.appendNewDigit(buttonText)
                }
                
                //init the calc with numeric digit clicked
                self.calcInit.text! = self.zeroValue
            }
            else {
                
                //reset inverse enumerate
                self.currentInputState = .Positive
                
                //determin double for ducplicate decimal display logic below
                var hasDecimal = self.displayValue.text!.rangeOfString(".")
                
                //first digit after operation has been set
                if(self.displayValue.text! == self.tempDisplayValue.text!)  {
                    
                    if(buttonText == ".") {
                        self.inputValue = "0."
                        self.displayValue.text! = self.inputValue
                        return
                    }
                    else {
                        if(self.dupValues == false) {
                            self.inputValue = buttonText
                        }
                        else {
                            if(hasDecimal == nil) {
                                self.inputValue = "\(self.displayValue.text!)\(self.displayValue.text!)"
                            }
                            else {
                                self.inputValue = "\(self.displayValue.text!)\(buttonText)"
                            }
                            //duplicate no longer
                            self.dupValues = false
                        }
                    }
                    
                    //handle duplicate digits
                    if(self.inputValue == buttonText){
                        self.dupValues = true
                    }

                }
                else {
                    //second digit after operation has been det
                    self.dupValues = false
                    self.calcInit.text! = "0"
                    self.appendNewDigit(buttonText)

                    //determin duplicate decimal values with doubles greater than tenths
                    if(hasDecimal != nil) {
                        if(self.inputValue == self.tempDisplayValue.text!) {
                            self.dupValues = true
                        }
                    }
                }
            }
        }
        else {  //non-numeric buttons

            var tempValue = self.tempDisplayValue.text!
            var displayValue = self.tempDisplayValue.text!
            
            //check calcInit value first
            if(self.calcInit.text! == self.zeroValue) {
                
                //memory buttons
                if (buttonText.rangeOfString("M") != nil) {
                    self.memoryButtons(buttonText)
                }
                
                //standard operations
                if((buttonText == "+") || (buttonText == "-") || (buttonText == "x") || (buttonText == "÷")) {
                    if(self.operationSign.text! == self.blankValue){
                        self.operationSign.text! = buttonText
                        self.tempValue = self.displayValue.text!
                    }
                    else {
                        opperation(tempValue, valueTwo: displayValue, operationSign: buttonText)
                    }
                }
                
                //non-standard operations
                if(buttonText == "%") {
                    if(self.displayValue.text! != self.zeroValue){
                        self.inputValue = opperation(self.displayValue.text!, valueTwo: "100", operationSign: "÷")
                    }
                }
                if(buttonText == "+/-") {
                    //check if non zero digit exists in display
                    if(self.displayValue.text! != self.zeroValue) {
                        //Positive to Negative
                        if(self.currentInputState == .Positive) {
                            self.currentInputState = .Negative
                            self.inputValue = "-\(self.displayValue.text!)"
                        }
                        else {
                            self.currentInputState = .Positive
                            self.inputValue =  dropFirst(self.displayValue.text!)
                        }
                    }
                }
                
                //equals
                if (buttonText == "=") {
                    if(self.operationSign.text! == self.blankValue) {
                        return
                    }
                    else {
                        var calculatedValue:String = opperation(tempValue, valueTwo: self.displayValue.text!, operationSign: self.operationSign.text!)
                        
                        //display solution
                        if((calculatedValue != "inf") && (calculatedValue != "-inf")) {
                            self.inputValue = calculatedValue
                        }
                        else {
                            //reset calc
                            self.calcInit.text! = "1"
                            
                            //display error
                            self.inputValue = "Error"
                        }
                        
                        //reset state
                        self.dupValues = false
                        self.currentInputState = .Positive
                        
                        //reset hidden labels
                        self.tempValue = blankValue
                        self.operationSign.text! = blankValue
                    }
                }
            
                //handle clear buttons
                if (buttonText.rangeOfString("C") != nil) {
                    self.clearButtons(buttonText)
                }
            }
            else {
                return
            }
        }
        
        //update display value
        self.displayValue.text! = self.inputValue
        
        //update temp value
        self.tempDisplayValue.text! = self.tempValue
        
        //update memory value
        self.memoryDisplayValue.text! = self.memoryValue

    }
    
    func checkButtonType(digit:String) -> Bool {
        var buttonValue : Int {
            return NSString(string:digit).integerValue
        }
        if((buttonValue > 0) || (digit == "0") || (digit == ".")) {
            return true
        }
        else {
            return false
        }
    }

    func memoryButtons(memoryButton:String) {
        
        //save displayValue to memory
        if(memoryButton == "MS") {
            self.memoryValue = self.displayValue.text!
            return
        }
        
        //if memory value exists
        if(self.memoryDisplayValue.text! != self.blankValue) {
            if(memoryButton == "MR") {
                self.inputValue = self.memoryDisplayValue.text!
            }
            else if(memoryButton == "M+") {
                var currentMemoryValue = self.memoryDisplayValue.text!
                var currentDisplayValue = self.displayValue.text!
                var addToMemory = opperation(currentMemoryValue, valueTwo: currentDisplayValue, operationSign: "+")
                self.memoryValue = addToMemory
            }
            else if(memoryButton == "M-") {
                var currentMemoryValue = self.memoryDisplayValue.text!
                var currentDisplayValue = self.displayValue.text!
                var subtractFromMemory = opperation(currentMemoryValue, valueTwo: currentDisplayValue, operationSign: "-")
                self.memoryValue = subtractFromMemory
            }
            else {
                clearButtons(memoryButton)
            }
        }
        else {
            return
        }
    }
    
    func clearButtons(clearButton:String) {
        if(clearButton == "AC") {
            //update display values
            self.inputValue = self.zeroValue
            self.memoryValue = self.blankValue
            self.tempValue = self.blankValue
            
            //reset state
            self.dupValues = false
            self.currentInputState = .Positive
            
            //update label values
            self.calcInit.text! = "1"
            self.operationSign.text! = self.blankValue
        }
        else if(clearButton == "MC") {
            self.memoryValue = self.blankValue
        }
        else {
            self.inputValue = self.zeroValue
            self.currentInputState = .Positive
        }
    }
    
    func appendNewDigit(digit:String) {
        self.inputValue += digit
    }
    
    func opperation(valueOne:String, valueTwo:String, operationSign:String) -> String {
        //init calc double value
        var calculationResult:Double = 0.0
        
        var valueOne : Double {
            return NSString(string:valueOne).doubleValue
        }
        var valueTwo : Double {
            return NSString(string:valueTwo).doubleValue
        }
        
        //standard operations
        if(operationSign == "+") {
            calculationResult = valueOne + valueTwo
        }
        else if(operationSign == "-") {
            calculationResult = valueOne - valueTwo
        }
        else if(operationSign == "x") {
            calculationResult = valueOne * valueTwo
        }
        else if(operationSign == "÷") {
            calculationResult = valueOne / valueTwo
        }
        
        //convert double to string
        var calculationResultStringified = calculationResult.description
        
        //remove double if .0
        var calculatedValueLength = count(calculationResultStringified)
        var decimalIndex = calculatedValueLength - 2
        var isDecimal = calculationResultStringified[advance(calculationResultStringified.startIndex, decimalIndex)]
        var lastDigit = last(calculationResultStringified)!
        var conactCheck = "\(isDecimal)\(lastDigit)"
        if(conactCheck == ".0") {
            calculationResultStringified = calculationResultStringified.substringToIndex(advance(calculationResultStringified.startIndex, decimalIndex))
        }
        
        return calculationResultStringified
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.memoryDisplayValue.layer.cornerRadius = 8
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

