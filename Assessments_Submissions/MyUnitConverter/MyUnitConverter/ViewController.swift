//
//  ViewController.swift
//  MyUnitConverter
//
//  Created by Eric Holland on 5/31/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var inputValue : String = ""
    
    @IBOutlet weak var inputValueLabel: UILabel!
    @IBOutlet weak var inputUnitsLabel: UILabel!
    
    @IBOutlet weak var outputValueLabel: UILabel!
    @IBOutlet weak var outputUnitsLabel: UILabel!
    
    @IBAction func onButtonPressed(sender:UIButton) {
        //get text label from UIButton
        let buttonText = sender.titleLabel!.text!
        
        if buttonText == "C" {
            //clear the input value
            self.clearInputValue()
        }
        else {
            //append digits
            self.appendNewDigit(buttonText)
        }
        
        //update the input value's UI Label
        self.inputValueLabel.text = self.inputValue
    }
    
    func clearInputValue() {
        self.inputValue = ""
        self.outputValueLabel.text = ""
    }
    
    func appendNewDigit(digit:String) {
        self.inputValue += digit
//        self.inputValueLabel.layer.borderWidth = 1.0;
    }
    
    //get inputValue and convert to a Double
    var valueToConvert : Double {
        return NSString(string:self.inputValue).doubleValue
    }

    //convert to input value (output value)
    func convertAndDisplay(converter:Conversion) {
        let outputValue = converter.convert(valueToConvert)
        
        //update the output value label
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
    
    @IBAction func convertLbsToKg(sender: AnyObject) {
        self.convertAndDisplay(PoundsToKilograms())
    }
    
    @IBAction func InchesToCentimeters(sender: AnyObject) {
        self.convertAndDisplay(FahrenheitToCelsius())
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

