//
//  LogInViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/14/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    var pinCode:String = ""
    
    @IBOutlet weak var hiddenCodeField: UITextField!

    
    @IBAction func onButtonPressed(sender:UIButton) {
        
        //set button
        let buttonText = sender.titleLabel!.text!
        
        self.pinCode += buttonText
        
        //update display value
        self.hiddenCodeField.text! = self.pinCode
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //check for pin
    override func viewWillAppear(animated: Bool) {
        

        self.loadFromDefaults()
        
        println(pinCode)
        
        if(pinCode == "") {
            //loads center tab on app init
            self.tabBarController?.selectedIndex = 2
        }
 

        
    }
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    func saveInDefaults() {

        //self.defaultsMgr.setValue(pinCode, forKey:"pinCode")
    }
    
    func loadFromDefaults() {
        

        
        if let pinCodeValue = self.defaultsMgr.valueForKey("pinCode") as? String {
            
            self.pinCode = pinCodeValue
        }
        
        
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
