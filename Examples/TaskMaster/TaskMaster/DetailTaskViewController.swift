//
//  DetailTaskViewController.swift
//  TaskMaster
//
//  Created by William Martin on 5/20/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class DetailTaskViewController: UIViewController {
    var task : Task!
    var indexPath : NSIndexPath!
    var mainViewController : ViewController!
    
    @IBOutlet var taskTitleLabel : UILabel!
    @IBOutlet var taskDescriptionTextView : UITextView!
    
//    @IBAction func done() {
//        let title = self.taskTitleTextField.text
//        self.task.title = title
//        
//        let description = self.taskDescriptionTextView.text
//        self.task.description = description
//        
//        if let _navigationController = self.navigationController {
//            let table = self.mainViewController.tableView
//            
//            table.reloadRowsAtIndexPaths([self.indexPath], withRowAnimation: .None)
//            table.deselectRowAtIndexPath(self.indexPath, animated: false)
//            
//            _navigationController.popViewControllerAnimated(true)
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Populate all the fields.
        self.taskTitleLabel.text = self.task.title
        self.taskDescriptionTextView.text = self.task.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editTaskSegue" {
            
        }
    }
    
    func insertNewTask(task:Task) {
        
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
