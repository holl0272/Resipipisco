//
//  ContactsViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/5/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit


class NameTextFieldDelegate : UIResponder, UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    var contacts: String!
    
    var nameTextField: UITextField?;
    var codeTextField: UITextField?;
    var numberTextField: UITextField?;

    @IBOutlet var tableView: UITableView!
    
    @IBAction func didTapAdd(sender: UIBarButtonItem) {

        var title = "New Contact";
        var message = "Enter Name and Number Below\n\n\n";
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        alert.modalInPopover = true;
        
        func handleOk(alertView: UIAlertAction!){
            
            var name: String = self.nameTextField!.text;
            var code: String = self.codeTextField!.text;
            var number: String = self.numberTextField!.text;
            var fullNumber: String = ""
            
            if((code != "") && (number != "")) {
                fullNumber = "\(code)"+"\(number)"
            }

            if((name != "") && (fullNumber != "")) {
                // get the new races and capitalize the string
                var newContactName = name.capitalizedString
                var newContactValue = "\(newContactName):\(fullNumber)"
                
                // add the new race in the list
                DataManager.sharedInstance.addContactInfo(conatcts: contacts, info: newContactValue)
                
                // create the index path for the last cell
                var newIndexPath = NSIndexPath(forRow: contactInfo.count - 1, inSection: 0)
                
                // insert the new cell in the table view and show an animation
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
        
        var phoneFrame = CGRectMake(0, 70, 270, 75);
        var inputView: UIView = UIView(frame: phoneFrame);
        
        var nameFrame = CGRectMake(20, 30, 240, 25);
        var myNameTextField: UITextField = UITextField(frame: nameFrame);
        myNameTextField.placeholder = "Name";
        myNameTextField.textAlignment = NSTextAlignment.Center;
        myNameTextField.borderStyle = UITextBorderStyle.RoundedRect;
        myNameTextField.keyboardType = UIKeyboardType.Default;
        myNameTextField.autocorrectionType = UITextAutocorrectionType.No
        myNameTextField.returnKeyType = UIReturnKeyType.Done
        
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
        
        self.nameTextField = myNameTextField;
        self.codeTextField = zipCodeTextField;
        self.numberTextField = myNumberTextField;
        
        inputView.addSubview(self.nameTextField!);
        inputView.addSubview(self.codeTextField!);
        inputView.addSubview(self.numberTextField!);
        
        alert.view.addSubview(inputView);
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler:nil));
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler:handleOk));
        
        self.presentViewController(alert, animated: true, completion: nil);
        
        self.codeTextField!.delegate = self
        self.numberTextField!.delegate = self
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if(textField.tag == 1) {
            let zipCodeLength = count(textField.text.utf16) - range.length
            if(zipCodeLength < 3) {
                return true
            }
            else {
                return false
            }
        }
        else if(textField.tag == 2) {
            let zipCodeLength = count(textField.text.utf16) - range.length
            if(zipCodeLength < 7) {
                return true
            }
            else {
                return false
            }
        }
        else {
            return true
        }
    }
        
    var contactInfo: [String] {
        return DataManager.sharedInstance.contacts[contacts]!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = contacts
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactInfo.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        var delimiter = ":"
        var fullString = contactInfo[indexPath.row]
        var name = fullString.componentsSeparatedByString(delimiter)
        
        cell.textLabel!.text = name[0]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            var contactToRemove = contactInfo[indexPath.row]
    
            DataManager.sharedInstance.removeRace(contacts: contacts, info: contactToRemove)
    
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var info = contactInfo[indexPath.row]
        
        var contactInfoViewController = storyboard?.instantiateViewControllerWithIdentifier("ContactInfoViewController") as! ContactInfoViewController
        
        contactInfoViewController.info = info
        
        navigationController?.pushViewController(contactInfoViewController, animated: true)
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
