//
//  InspirationMasterViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/18/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class InspirationMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    var items: [String] = ["Show In App Inspiration", "Favorite Passages", "Get Inspired"]
    
    var string:String = ""
    
    var enabledSwitch = UISwitch(frame: CGRectZero) as UISwitch
    
    @IBAction func unwindToContainerVC(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func inAppInspirationSwitch(sender: UISwitch) {
        if(sender.on == true) {
            self.defaultsMgr.setValue(false, forKey:"inAppInspiration")
        }
        else {
            self.defaultsMgr.setValue(false, forKey:"inAppInspiration")
        }
    }
    
    @IBAction func returnToMasterFromInspiration(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("returnToMasterFromInspiration", sender: self)
    }
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Inspiration Options"
        
        string = "\(loadFavoritesFromDefaults())"
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList:",name:"load", object: nil)
        
        var hasConnection = Reachability.isConnectedToNetwork()
        
        println(hasConnection)

        // Do any additional setup after loading the view.
        enabledSwitch.addTarget(self, action: "inAppInspirationSwitch:", forControlEvents: .TouchUpInside)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func loadList(notification: NSNotification){
        //load data here
        string = "\(loadFavoritesFromDefaults())"
        self.tableView.reloadData()
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        var accesoryBadge = UILabel()
        accesoryBadge.text = string
        accesoryBadge.textColor = UIColor.whiteColor()
        accesoryBadge.font = UIFont(name: "Lato-Regular", size: 16)
        accesoryBadge.textAlignment = NSTextAlignment.Center
        accesoryBadge.layer.cornerRadius = 15
        accesoryBadge.backgroundColor = UIColor.redColor()
        accesoryBadge.clipsToBounds = true
        
        accesoryBadge.frame = CGRectMake(0, 0, 30, 30)
        
        if(indexPath.row > 0) {
            if(indexPath.row == 1) {
                cell.accessoryView = accesoryBadge
            }
            else {
                cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

            }
        }
        else {
            enabledSwitch.on = isInAppInspirationTurnedOn()
            cell.accessoryView = enabledSwitch
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var inspirationIndexViewController = UIViewController()
        
        switch (indexPath.row) {
        case 0:
            var currentInAppInspirationState:Bool = isInAppInspirationTurnedOn()
            if(currentInAppInspirationState) {
                self.defaultsMgr.setValue(false, forKey:"inAppInspiration")
            }
            else {
                self.defaultsMgr.setValue(true, forKey:"inAppInspiration")
            }
            enabledSwitch.on = isInAppInspirationTurnedOn()
        case 1:
            inspirationIndexViewController = storyboard?.instantiateViewControllerWithIdentifier("FavoriteInspirationViewController") as! FavoriteInspirationViewController
            navigationController?.pushViewController(inspirationIndexViewController, animated: true)
        case 2:
            inspirationIndexViewController = storyboard?.instantiateViewControllerWithIdentifier("InspirationViewController") as! InspirationViewController
            navigationController?.pushViewController(inspirationIndexViewController, animated: true)
        default:
            println("You selected cell ???")
        }
        

    }
    
    func isInAppInspirationTurnedOn() -> Bool {
        
        var inAppInspirationState:Bool!
        if let state = self.defaultsMgr.valueForKey("inAppInspiration") as? Bool {
            inAppInspirationState = state
        }
        
        return inAppInspirationState
    }
    
    func loadFavoritesFromDefaults() -> Int {
        var arrayCount:Int = 0
        if let favoriteIDsIndexArray = self.defaultsMgr.valueForKey("favoriteIDs") as? [Int] {
            arrayCount = favoriteIDsIndexArray.count
        }
        
        return arrayCount
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
