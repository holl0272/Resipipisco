//
//  ViewController.swift
//  TableCells
//
//  Created by William Martin on 6/25/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit


extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}


class Message {
    var title: String
    var body: String
    
    init(title:String, body:String) {
        self.title = title
        self.body = body
    }
    
}


class MessageCell: UITableViewCell {
    var _message: Message!
    
    var message: Message! {
        get {
            return _message
        }
        set {
            _message = newValue
            titleLabel.text = self.message.title
            bodyText.text = self.message.body
        }
    }
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var bodyText : UITextView!

}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var messages : [Message] = [
        Message(title: "Hello!", body: "Nice to see you"),
        Message(title: "What's up?", body: "Looking forward to it!")
    ]
    
    @IBOutlet var messageTable : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let nib = UINib(nibName: "MessageTableCell", bundle: nil)
        self.messageTable.registerNib(nib, forCellReuseIdentifier: "MessageCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageCell", forIndexPath: indexPath) as! MessageCell
        
        cell.message = self.messages[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
}

