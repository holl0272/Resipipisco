//
//  ViewController.swift
//  MidTermCalc App
//
//  Created by Eric Holland on 6/1/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var tempValue : String = ""
    var inputValue : String = ""
    var memoryValue : String = ""
    
    var operationValue : String = ""

    var blankValue : String = ""
    var resetValue : String = "0"
    
    @IBOutlet weak var calcInit: UILabel!
    @IBOutlet weak var operationSign: UILabel!
    

    @IBOutlet weak var displayValue: UILabel!
    @IBOutlet weak var tempDisplayValue: UILabel!
    @IBOutlet weak var memoryDisplayValue: UILabel!

    
    @IBAction func onButtonPressed(sender:UIButton) {
        
//        println(self.calcInit.text!)

        let buttonText = sender.titleLabel!.text!
        
        //check button type, returns true if digit
        let numericButton = checkButtonType(buttonText)
        
        if(numericButton) {
            //no opperation set
            if(self.operationSign.text! == "") {
                //handle 0 as first digit clicked
                if((self.inputValue == "") && (buttonText == "0")) {
                    return
                }
                else if((self.inputValue == "") && (buttonText == ".")) {
                    //first non-zero digit clicked
                    self.inputValue = "0."
                }
                else if(self.inputValue == "") {
                    self.inputValue = buttonText
                }
                else {
                    //first non-zero digit clicked
                    self.appendNewDigit(buttonText)
                }
                
                //init the calc with numeric digit clicked
                self.calcInit.text! = "0"
            }
            else {
                
            }
        }
        else {  //non-numeric buttons
            
            //check calcInit value first
            if(self.calcInit.text! == "0") {
                //memory buttons
                if (buttonText.rangeOfString("M") != nil) {
                    self.memoryButtons(buttonText)
                }
                
                //operations
                if ((buttonText == "+") || (buttonText == "-") || (buttonText == "X") || (buttonText == "÷")) {
                    //if(self.operationSign.text! == ""){
                        self.operationSign.text! = buttonText
                        self.tempValue = self.displayValue.text!
                    //}
                    //opperation(valueOne:String, valueTwo:String, operationSign:String)
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
            if(self.displayValue.text! == "0") {
                self.memoryValue = blankValue
            }
            else {
                self.memoryValue = self.displayValue.text!
                self.inputValue = resetValue
            }
        }
        
        //if memory value exists
        if(self.memoryDisplayValue.text! != "") {
            if(memoryButton == "MR") {
                self.inputValue = self.memoryDisplayValue.text!
            }
            else if(memoryButton == "M+") {
                var currentMemoryValue = self.memoryDisplayValue.text!
                var currentInputValue = self.displayValue.text!
                self.inputValue = resetValue
                opperation(currentMemoryValue, valueTwo: currentInputValue, operationSign: "+")
            }
            else if(memoryButton == "M-") {
                var currentMemoryValue = self.memoryDisplayValue.text!
                var currentInputValue = self.displayValue.text!
                self.inputValue = resetValue
                opperation(currentMemoryValue, valueTwo: currentInputValue, operationSign: "-")
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
            self.inputValue = resetValue
            self.memoryValue = blankValue
        }
        else if(clearButton == "MC") {
            self.memoryValue = blankValue
        }
        else {
            self.inputValue = resetValue
        }
    }
    
    func appendNewDigit(digit:String) {
        self.inputValue += digit
    }
    
    func opperation(valueOne:String, valueTwo:String, operationSign:String) {
        //init calc double value
        var calculationResult:Double = 0.0
        
        var valueOne : Double {
            return NSString(string:valueOne).doubleValue
        }
        var valueTwo : Double {
            return NSString(string:valueTwo).doubleValue
        }
        if(operationSign == "+") {
            calculationResult = valueOne + valueTwo
        }
        else if(operationSign == "-") {
            calculationResult = valueOne - valueTwo
        }
        
        //convert double to string
        var calculationResultStringified = calculationResult.description
        
        self.memoryValue = calculationResultStringified

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

