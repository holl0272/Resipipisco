//
//  ViewController.swift
//  DogCatalog
//
//  Created by William Martin on 5/19/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit


class TableViewDelegate : NSObject, UITableViewDelegate {
    
}

class TableViewDataSource : NSObject, UITableViewDataSource {
    var tableView : UITableView!
    var objects = ["Toshi", "Kuma", "Layla", "Neeko"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let object = self.objects[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    
    var dogSource = TableViewDataSource()
    var dogDelegate = TableViewDelegate()
    
    @IBAction func addNewDog() {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self.dogDelegate

        let source = TableViewDataSource()
        self.tableView.dataSource = self.dogSource
        self.dogSource.tableView = self.tableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

