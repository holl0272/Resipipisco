//
//  NewDogViewController.swift
//  DogCatalog
//
//  Created by William Martin on 5/20/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class NewDogViewController: UIViewController {
    var mainViewController : ViewController!
    
    @IBOutlet var dogNameTextField : UITextField!
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        
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
