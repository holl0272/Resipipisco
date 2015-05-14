//
//  ModalViewController.swift
//  DismissModal
//
//  Created by William Martin on 5/14/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    @IBOutlet weak var myTextField: UITextField!

    @IBAction func onDismissTapped(sender: AnyObject) {
        // Get the text from the text field.
        let newLabelText = self.myTextField.text
        
        // Get a reference to the view controller we came from
        // with the correct type.
        let myViewController = self.presentingViewController as! ViewController
        
        // Get a reference to the IBOutlet-referenced UILabel 
        // in the other View Controller.
        let theTextLabel = myViewController.myLabel
        
        // Set the text of that label to the new text from the text field.
        theTextLabel.text = newLabelText
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
