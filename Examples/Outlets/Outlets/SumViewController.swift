//
//  ViewController.swift
//  Outlets
//
//  Created by William Martin on 5/12/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class SumViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func myButtonTapped(sender: UIButton) {
        self.myLabel.text = self.myTextField.text
        self.myLabel.textColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
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

