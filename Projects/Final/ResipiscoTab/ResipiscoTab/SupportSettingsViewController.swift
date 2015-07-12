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
    
    var nameTextField: UITextField?;
    var numberTextField: UITextField?;

    @IBOutlet var sponsorSwitch: UISwitch!
    @IBOutlet var updateSponsorButton: UIButton!
    
    @IBAction func updateSponsorPhone(sender: UIButton) {
        
        var title = "Sponsor Contact";
        var message = "Enter Their Name and Number Below\n\n\n";
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        alert.modalInPopover = true;
        
        func handleOk(alertView: UIAlertAction!){
            
            var name: String = self.nameTextField!.text;
            var number: String = self.numberTextField!.text;
            
            if((name != "") && (number != "")) {
                
                var removePhoneFormat = number.stringByReplacingOccurrencesOfString("(", withString: "")
                    removePhoneFormat = removePhoneFormat.stringByReplacingOccurrencesOfString(")", withString: "")
                    removePhoneFormat = removePhoneFormat.stringByReplacingOccurrencesOfString(" ", withString: "")
                    removePhoneFormat = removePhoneFormat.stringByReplacingOccurrencesOfString("-", withString: "")
                
                println("var\(removePhoneFormat)")
                
                var sponsorNameNumber:String = "\(name):\(removePhoneFormat)"
                self.defaultsMgr.setValue(sponsorNameNumber, forKey:"sponsor")
            }
        }
        
        var phoneFrame = CGRectMake(0, 70, 270, 75);
        var inputView: UIView = UIView(frame: phoneFrame);
        
        var nameFrame = CGRectMake(35, 0, 200, 25);
        var myNameTextField: UITextField = UITextField(frame: nameFrame);
        myNameTextField.placeholder = "Sponsor's Name";
        myNameTextField.textAlignment = NSTextAlignment.Center;
        myNameTextField.borderStyle = UITextBorderStyle.RoundedRect;
        myNameTextField.keyboardType = UIKeyboardType.Default;
        myNameTextField.autocorrectionType = UITextAutocorrectionType.No
        myNameTextField.returnKeyType = UIReturnKeyType.Done
        
        var numberFrame = CGRectMake(35, 30, 200, 25);
        var myNumberTextField: UITextField = UITextField(frame: numberFrame);
        myNumberTextField.tag = 1;
        myNumberTextField.placeholder = "Phone Number";
        myNumberTextField.textAlignment = NSTextAlignment.Center;
        myNumberTextField.borderStyle = UITextBorderStyle.RoundedRect;
        myNumberTextField.keyboardType = UIKeyboardType.PhonePad;
        
        self.numberTextField = myNumberTextField;
        self.nameTextField = myNameTextField;
        
        inputView.addSubview(self.numberTextField!);
        inputView.addSubview(self.nameTextField!);
        
        alert.view.addSubview(inputView);
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler:nil));
        alert.addAction(UIAlertAction(title: "Update", style: UIAlertActionStyle.Default, handler:handleOk));
        
        self.presentViewController(alert, animated: true, completion: nil);
 
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
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
            var newString = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
            var components = newString.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
            var decimalString = "".join(components) as NSString
            var length = decimalString.length
            var hasLeadingOne = length > 0 && decimalString.characterAtIndex(0) == (1 as unichar)
            
            if length == 0 || (length > 10 && !hasLeadingOne) || length > 11 {
                var newLength = (textField.text as NSString).length + (string as NSString).length - range.length as Int
                
                return (newLength > 10) ? false : true
            }
            var index = 0 as Int
            var formattedString = NSMutableString()
            
            if hasLeadingOne {
                formattedString.appendString("1 ")
                index += 1
            }
            if (length - index) > 3 {
                var areaCode = decimalString.substringWithRange(NSMakeRange(index, 3))
                formattedString.appendFormat("(%@) ", areaCode)
                index += 3
            }
            if length - index > 3 {
                var prefix = decimalString.substringWithRange(NSMakeRange(index, 3))
                formattedString.appendFormat("%@-", prefix)
                index += 3
            }
            
            var remainder = decimalString.substringFromIndex(index)
            formattedString.appendString(remainder)
            numberTextField!.text = formattedString as String
            return false
        } else {
            return true
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
