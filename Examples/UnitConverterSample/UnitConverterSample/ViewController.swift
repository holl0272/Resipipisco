//
//  ViewController.swift
//  UnitConverterSample
//
//  Created by William Martin on 5/21/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.updateInputValue()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    var _currentInputValue : String = ""
    
    var currentInputValue : String {
        set (value) {
            self._currentInputValue = value
            self.updateInputValue()
        }
        
        get {
            return self._currentInputValue
        }
    }

    @IBOutlet weak var inputValue: UILabel!
    @IBOutlet weak var outputValue: UILabel!
    @IBOutlet weak var inputUnits: UILabel!
    @IBOutlet weak var outputUnits: UILabel!
    
    func updateInputValue() {
        self.inputValue.text = "\(self.currentInputValue)"
    }

    @IBAction func clear(sender: AnyObject) {
        self.currentInputValue = ""
    }
    
    @IBAction func onButtonPressed(sender:UIButton?) {
        if let _button = sender {
            let valueTyped = _button.titleLabel!.text!
            self.currentInputValue += valueTyped
        }
    }
    
    @IBAction func onPressedFtoC() {
        let converter = FahrenheitToCelsius()
        
        let F = NSString(string:self.currentInputValue).doubleValue
        let C = converter.convert(F)
        
        self.outputValue.text = "\(C)"
        self.inputUnits.text = converter.imperialUnits
        self.outputUnits.text = converter.metricUnits
    }
}

