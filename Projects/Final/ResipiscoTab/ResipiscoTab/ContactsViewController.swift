//
//  ContactsViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/5/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate {
    
    var contacts: String!

    @IBOutlet var tableView: UITableView!
    
    @IBAction func didTapAdd(sender: UIBarButtonItem) {
        var alert = UIAlertView(title: "New Contact", message: "Type in their name", delegate: self,
            cancelButtonTitle: "Cancel",
            otherButtonTitles: "Add")
        
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            // there is only one text field
            var textField = alertView.textFieldAtIndex(0)!
            
            // get the new races and capitalize the string
            var newContact = textField.text.capitalizedString
            
            // add the new race in the list
            DataManager.sharedInstance.addContactInfo(conatcts: contacts, info: newContact)
            
            // create the index path for the last cell
            var newIndexPath = NSIndexPath(forRow: contactInfo.count - 1, inSection: 0)
            
            // insert the new cell in the table view and show an animation
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
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
        
        cell.textLabel!.text = contactInfo[indexPath.row]
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
