//
//  ViewContactsViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/5/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class ViewContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func returnToSuportViewController(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("returnToSuportViewController", sender: self)
    }
    
    @IBOutlet var tableView: UITableView!
    
    var contacts: [String] = DataManager.sharedInstance.contactsList

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "My Contacts"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel!.text = contacts[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var contactsViewController = storyboard?.instantiateViewControllerWithIdentifier("ContactsViewController") as! ContactsViewController
        
        contactsViewController.contacts = contacts[indexPath.row]
        
        navigationController?.pushViewController(contactsViewController, animated: true)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBarHidden = false
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
