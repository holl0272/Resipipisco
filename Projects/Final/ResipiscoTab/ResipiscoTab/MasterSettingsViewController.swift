//
//  MasterSettingsViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/20/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class MasterSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var items: [String] = ["Sobriety Date", "Personalization", "Passcode"]
    
    @IBAction func returnFromMasterSettings(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("returnFromMasterSettings", sender: self)
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Master App Settings"

        // Do any additional setup after loading the view.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var masterSettingsIndexViewController = UIViewController()
        
        switch (indexPath.row) {
        case 0:
            masterSettingsIndexViewController = storyboard?.instantiateViewControllerWithIdentifier("sobrietyDateViewController") as! SobrietyDateViewController
        case 1:
            masterSettingsIndexViewController = storyboard?.instantiateViewControllerWithIdentifier("personalizationViewController") as! PersonalizationViewController
        case 2:
            masterSettingsIndexViewController = storyboard?.instantiateViewControllerWithIdentifier("passcodeViewController") as! PasscodeViewController
        default:
            println("You selected cell ???")
        }
        
        navigationController?.pushViewController(masterSettingsIndexViewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backFromModal(segue: UIStoryboardSegue) {
        self.tabBarController?.selectedIndex = 4
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
