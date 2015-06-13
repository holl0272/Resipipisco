//
//  ViewController.swift
//  CoreDataTasks
//
//  Created by William Martin on 6/11/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tasksTableView: UITableView!
    
//    var tasks = ["Buy Apple Watch", "Buy a dog", "Return the cat to the shelter"]
    var tasks = [NSManagedObject]()
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Get the managed object context (a core data thing)
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "Task")
        
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(
            fetchRequest,
            error: &error
        ) as? [NSManagedObject]
        
        if let fetchedTasks = fetchedResults {
            self.tasks = fetchedTasks
        } else {
            println("OOOPS!")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let taskViewController = segue.destinationViewController as? NewTaskViewController
        taskViewController!.mainViewController = self
    }
    
    func addNewTask(taskTitle:String) {
        // The OLD way.
//        self.tasks.append(taskTitle)
        
        // The new shit.
        
        // Get the instance of the AppDelegate.
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Get the managed object context (a core data thing)
        let managedContext = appDelegate.managedObjectContext!
        
        // Get a description of the "entity" (i.e. core data class)
        let entity =  NSEntityDescription.entityForName(
            "Task",
            inManagedObjectContext: managedContext
        )
        
        // Create the managed object.
        let task = NSManagedObject(
            entity: entity!,
            insertIntoManagedObjectContext: managedContext
        )
        
        task.setValue(taskTitle, forKey: "taskTitle")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        self.tasks.append(task)
        
        self.tasksTableView.reloadData()
    }

    // Table stuff
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath) as! UITableViewCell
        
        let task = self.tasks[indexPath.row]
        let title = task.valueForKey("taskTitle") as? String
        cell.textLabel!.text = title!
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}





