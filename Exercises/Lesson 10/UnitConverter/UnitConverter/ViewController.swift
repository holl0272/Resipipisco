//
//  ViewController.swift
//  UnitConverter
//
//  Created by William Martin on 5/21/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var inputValue : String = ""

    @IBOutlet weak var inputValueLabel: UILabel!
    @IBOutlet weak var outputValueLabel: UILabel!
    
    @IBOutlet weak var inputUnitsLabel: UILabel!
    @IBOutlet weak var outputUnitsLabel: UILabel!
    
    
    @IBAction func onButtonPressed(sender:UIButton) {
        // Get the text label from the UIButton
        let buttonText = sender.titleLabel!.text!
        
        // if C:
        //     Clear the input value
        // if 0-9 or the dot:
        //     Add it to the "input value"

        if buttonText == "C" {
            // Clear the input value
            self.clearInputValue()
        } else {
            // Append the digit to the end of the input value
            self.appendNewDigit(buttonText)
        }
        
//        println("inputValue = \(self.inputValue)")
        
        // Update the input value's UILabel
        self.inputValueLabel.text = self.inputValue
    }
    
    func clearInputValue() {
        self.inputValue = ""
        self.outputValueLabel.text = ""
    }
    
    func appendNewDigit(digit:String) {
        self.inputValue += digit
    }


    var valueToConvert : Double {
        // Get the inputValue and convert to a Double
        return NSString(string:self.inputValue).doubleValue
    }
    
    // Convert the input value (output value)
    func convertAndDisplay(converter:Conversion) {
        let outputValue = converter.convert(valueToConvert)
        //        println(outputValue)
        
        // Update the output value label
        self.outputValueLabel.text = "\(outputValue)"
        
        // Update the input and output units labels
        self.inputUnitsLabel.text = converter.imperialUnits
        self.outputUnitsLabel.text = converter.metricUnits
    }
    
    @IBAction func convertFtoC(sender: AnyObject) {
        self.convertAndDisplay(FahrenheitToCelsius())
    }
    
    @IBAction func convertMiToKm(sender: AnyObject) {
        self.convertAndDisplay(MilesToKilometers())
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

