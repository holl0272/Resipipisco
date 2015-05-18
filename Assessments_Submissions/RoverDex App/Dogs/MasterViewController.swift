//
//  MasterViewController.swift
//  Dogs
//
//  Created by Eric Holland on 5/14/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = [Dog]()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
//        self.navigationItem.rightBarButtonItem = addButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: Dog) {
        let dogName:String = sender.name
        let dogBreed:String = sender.breed!
        let dogColor:String = sender.color!
        let dogAge:String = sender.age!
        let dogSex:String = sender.sex!
        let dogWeight:String = sender.weight!
        let dogHeight:String = sender.height!
        let dogBark:String = sender.barkSound!
        
        objects.insert(Dog(name:dogName,breed:dogBreed,color:dogColor,age:dogAge,sex:dogSex,weight:dogWeight,height:dogHeight,barkSound:dogBark), atIndex: 0)
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        println(indexPath)
        
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: Dog) {
        
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as Dog
                (segue.destinationViewController as DetailViewController).detailItem = object
            }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
//TODO: - Customerize this cell to display the name of a Dog.
        let object = objects[indexPath.row] as Dog
        cell.textLabel!.text = object.name
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

