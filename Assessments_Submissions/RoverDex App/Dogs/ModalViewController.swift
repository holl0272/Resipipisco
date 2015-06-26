//
//  ViewController.swift
//  Dogs
//
//  Created by Eric Holland on 5/14/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var barkSoundTextField: UITextField!
    
    @IBAction func clearFields(sender: UIButton) {
        self.nameTextField.text = ""
        self.breedTextField.text = ""
        self.colorTextField.text = ""
        self.ageTextField.text = ""
        self.sexTextField.text = ""
        self.weightTextField.text = ""
        self.heightTextField.text = ""
        self.barkSoundTextField.text = ""
    }
    
    @IBAction func onDismissTapped(sender: UIButton) {
        
        let dogName = self.nameTextField.text
        
        if(dogName != "") {
            let dogBreed = self.breedTextField.text
            let dogColor = self.colorTextField.text
            let dogAge = self.ageTextField.text
            let dogSex = self.sexTextField.text
            let dogWeight = self.weightTextField.text
            let dogHeight = self.heightTextField.text
            let dogBark = self.barkSoundTextField.text
            
            var newDog = Dog(name:dogName,breed:dogBreed,color:dogColor,age:dogAge,sex:dogSex,weight:dogWeight,height:dogHeight,barkSound:dogBark)
            
            let navigator = self.presentingViewController as! UINavigationController
            let controller = navigator.viewControllers[0] as! MasterViewController
            
            controller.insertNewObject(newDog)
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            let alertController = UIAlertController(title: "Your Dog Has No Name?!", message:
                "Oops, looks like you forgot your Dog's name, type it in and try again!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func clearAndGoBack(sender: UIButton) {
        self.nameTextField.text = ""
        self.breedTextField.text = ""
        self.colorTextField.text = ""
        self.ageTextField.text = ""
        self.sexTextField.text = ""
        self.weightTextField.text = ""
        self.heightTextField.text = ""
        self.barkSoundTextField.text = ""
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
