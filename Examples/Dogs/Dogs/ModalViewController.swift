//
//  ModalViewController.swift
//  Dogs
//
//  Created by William Martin on 5/18/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    var masterViewController : MasterViewController!
    
    @IBOutlet weak var dogNameField : UITextField!
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addDog() {
        let newDogName = self.dogNameField.text
        let newDog = Dog(name:newDogName)
        self.masterViewController.insertNewObject(newDog)
        
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
