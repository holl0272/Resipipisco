//
//  NewTaskViewController.swift
//  TaskMaster
//
//  Created by William Martin on 5/19/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {

    
    var mainViewController : ViewController!
    
    @IBOutlet var newTaskTitle : UITextField!
    @IBOutlet var newTaskDescription : UITextView!
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        // Get the value from the text field.
        let title = self.newTaskTitle.text
        
        // Create a Task instance.
        let task = Task(title:title)
        
        let description = self.newTaskDescription.text
        task.description = description
        
        // Add to table view.
        self.mainViewController.insertNewTask(task)
        
        // Dismiss the modal.
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
