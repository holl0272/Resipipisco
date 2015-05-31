//
//  ViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    var todoViewController: MainTableViewController?
    
    @IBAction func didTapButton(sender: AnyObject) {
        todoViewController?.todos.append(textField.text)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         self.textField.delegate = self
        
        var notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserverForName(UIKeyboardDidShowNotification,
            object: nil,
            queue: nil) { (notification: NSNotification!) -> Void in
                // This code runs when "foo!" is posted
                self.textField.backgroundColor = UIColor.redColor()
        }
        
    }
    
    func textFieldDidBeginEditing(textFieldThatEdited: UITextField) {
       var someIntegerThatIsGreat = 1
        someIntegerThatIsGreat = 5
        textField.placeholder = "email@domain.com"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

