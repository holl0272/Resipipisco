//
//  ViewController.swift
//  Inclass_exercise_06
//
//  Created by Eric Holland on 5/12/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class SumViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myFirstTextField: UITextField!
    @IBOutlet weak var mySecondTextField: UITextField!

    @IBAction func myButton(sender: UIButton) {
        
        let myFirstTextFieldValue:String = self.myFirstTextField.text
        let mySecondTextFieldValue:String = self.mySecondTextField.text
        
        var firstDouble = NSString(string:myFirstTextFieldValue).doubleValue
        var secondDouble = NSString(string:mySecondTextFieldValue).doubleValue
        var sum = firstDouble + secondDouble
        
        self.myLabel.text = "\(sum)"
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

