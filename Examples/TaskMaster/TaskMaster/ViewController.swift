//
//  ViewController.swift
//  TaskMaster
//
//  Created by William Martin on 5/19/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView : UITableView!
    
//    var tasks = ["Order an Apple Watch", "Purchase AppleCare", "Sell my iPad"]
    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertNewTask(task:Task) {
        // Remember the data!
        self.tasks.append(task)
        
        // Update the table view!
        let indexPath = NSIndexPath(forRow: self.tasks.count - 1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newTaskSegue" {
            
            let destination = segue.destinationViewController as! NewTaskViewController
            destination.mainViewController = self
            
        } else if segue.identifier == "detailSegue" {
            
            let destination = segue.destinationViewController as! DetailTaskViewController
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPathForCell(cell)
            if let _indexPath = indexPath {
                let task = self.tasks[_indexPath.row]
                destination.task = task
                destination.indexPath = indexPath
                destination.mainViewController = self
            }
            
        }
    }

    // MARK: - Table View Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Get the cell
        let cell = self.tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath) as! UITableViewCell
        
        let task = self.tasks[indexPath.row]
        cell.textLabel!.text = task.title
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
}


















