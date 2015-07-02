//
//  NewTaskViewController.swift
//  CoreDataTasks
//
//  Created by William Martin on 6/11/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {
    var mainViewController: ViewController!
    
    @IBOutlet weak var taskTitleField: UITextField!

    @IBAction func onCancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onDoneTapped(sender: AnyObject) {
        // Get the task from the text field.
        let newTaskTitle = self.taskTitleField.text
        
        // Ask the previous view controller to add the new task to the list.
        self.mainViewController.addNewTask(newTaskTitle)
        
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
