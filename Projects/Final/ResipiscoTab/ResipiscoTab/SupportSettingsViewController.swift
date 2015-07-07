//
//  SupportSettingsViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/19/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class SupportSettingsViewController: UIViewController, UITextFieldDelegate {
        
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    var sponsorSwitchState:String = ""
    var codeTextField: UITextField?;
    var numberTextField: UITextField?;

    @IBOutlet var sponsorSwitch: UISwitch!
    @IBOutlet var updateSponsorButton: UIButton!
    
    @IBAction func updateSponsorPhone(sender: UIButton) {
        
        var title = "Sponsor Contact";
        var message = "Enter Phone Number Below\n\n\n";
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        alert.modalInPopover = true;
        
        func handleOk(alertView: UIAlertAction!){
            
            var code: String = self.codeTextField!.text;
            var number: String = self.numberTextField!.text;
            var fullNumber: String = ""
            
            if((code != "") && (number != "")) {
                fullNumber = "\(code)"+"\(number)"
            }
            
            if(fullNumber != "") {
                self.defaultsMgr.setValue(fullNumber, forKey:"sponsor")
            }
        }
        
        var phoneFrame = CGRectMake(0, 70, 270, 75);
        var inputView: UIView = UIView(frame: phoneFrame);
        
        var codeFrame = CGRectMake(20, 0, 65, 25);
        var zipCodeTextField: UITextField = UITextField(frame: codeFrame);
        zipCodeTextField.tag = 1;
        zipCodeTextField.placeholder = "Zip";
        zipCodeTextField.textAlignment = NSTextAlignment.Center;
        zipCodeTextField.borderStyle = UITextBorderStyle.RoundedRect;
        zipCodeTextField.keyboardType = UIKeyboardType.PhonePad;
        
        var numberFrame = CGRectMake(90, 0, 170, 25);
        var myNumberTextField: UITextField = UITextField(frame: numberFrame);
        myNumberTextField.tag = 2;
        myNumberTextField.placeholder = "Number (digits only)";
        myNumberTextField.textAlignment = NSTextAlignment.Center;
        myNumberTextField.borderStyle = UITextBorderStyle.RoundedRect;
        myNumberTextField.keyboardType = UIKeyboardType.PhonePad;
        
        self.codeTextField = zipCodeTextField;
        self.numberTextField = myNumberTextField;
        
        inputView.addSubview(self.codeTextField!);
        inputView.addSubview(self.numberTextField!);
        
        alert.view.addSubview(inputView);
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler:nil));
        alert.addAction(UIAlertAction(title: "Update", style: UIAlertActionStyle.Default, handler:handleOk));
        
        self.presentViewController(alert, animated: true, completion: nil);
        
        self.codeTextField!.delegate = self
        self.numberTextField!.delegate = self
        
    }
    
    @IBAction func showSponorSwitch(sender: UISwitch) {
        if(sender.on == true) {
            println("switch on")
            self.defaultsMgr.setValue("1", forKey:"showSponsor")
            self.updateSponsorButton.hidden = false
        }
        else {
            println("switch off")
            self.defaultsMgr.setValue("0", forKey:"showSponsor")
            self.updateSponsorButton.hidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadShowSponsorFromDefaults()
        
        if(sponsorSwitchState == "1") {
            self.sponsorSwitch.setOn(true, animated: true)
            self.updateSponsorButton.hidden = false
        }
        else {
            self.sponsorSwitch.setOn(false, animated: true)
            self.updateSponsorButton.hidden = true
        }

    }
    
    
    func loadShowSponsorFromDefaults() {
        if let sponsorValue = self.defaultsMgr.valueForKey("showSponsor") as? String {
            sponsorSwitchState = sponsorValue
        }
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
