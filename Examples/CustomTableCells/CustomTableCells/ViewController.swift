//
//  ViewController.swift
//  CustomTableCells
//
//  Created by William Martin on 6/25/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class User {
    var name : String
    var _id : Int
    var url : String
    
    var avatar : UIImage?
    
    init(id: Int, name: String, url: String) {
        self._id = id
        self.name = name
        self.url = url
    }
    
    func getAvatarFromServer(done:(()->Void)) {
        println("Getting an image")
        
        let imageUrlStr = "http://dogs.petbreeds.com/sites/default/files/465/media/images/Shiba_Inu_5187048.jpg"
        let url = NSURL(string: self.url)
        
        let session = NSURLSession.sharedSession()
        
        func onCompletion(location:NSURL!, response:NSURLResponse!, error:NSError!) {
            println("Done getting image data!")
            
            let imageData = NSData(contentsOfURL: location)
            let img = UIImage(data: imageData!)
            
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) {
                self.avatar = img
                done()
            }
        }
        
        let imageTask = session.downloadTaskWithURL(url!, completionHandler: onCompletion)
        imageTask.resume()
    }
}

class Message {
    var title : String
    var body : String
    
    var sender : User
    
    init(title:String, body:String, sender:User) {
        self.title = title
        self.body = body
        self.sender = sender
    }
}

class MessageCell: UITableViewCell {
    @IBOutlet var avatar : UIImageView!
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var bodyText : UITextView!
    
    var _message : Message!
    
    var message : Message {
        get {
            return _message
        }
        
        set {
            _message = newValue
            self.titleLabel.text = _message.title
            self.bodyText.text = _message.body
            
            self.avatar.image = _message.sender.avatar
        }
    }
}


class ViewController: UIViewController,
        UITableViewDataSource, UITableViewDelegate {
    
    var messages : [Message] = []
    
    @IBOutlet var messageList : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This crazy!
        let toshi = User(id: 0, name: "Toshi", url:"http://dogs.petbreeds.com/sites/default/files/465/media/images/Shiba_Inu_5187048.jpg")
        let doge = User(id:1, name: "Doge", url:"http://laughingsquid.com/wp-content/uploads/2013/12/20131231-16470752-doge.jpg")
        
        self.messages = [
            Message(title:"Hi there!", body:"What's happening to me?!?!?", sender:toshi),
            Message(title:"Wassup?", body:"Just kidding! Writing Testable Code As an engineer, you’re charged with much more than writing code that works. Code needs to be reliable, adaptable, and reusable.", sender:doge)
        ]
        
        // Do any additional setup after loading the view, typically from a nib.
        let nib = UINib(nibName: "MessageCell", bundle: nil)
        self.messageList.registerNib(nib, forCellReuseIdentifier: "MessageCell")
        
        toshi.getAvatarFromServer(self.updateAvatars)
        doge.getAvatarFromServer(self.updateAvatars)
    }
    
    func updateAvatars() {
        println("Updating the avatars!")
        self.messageList.reloadData()
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
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "MessageCell",
            forIndexPath: indexPath
        ) as! MessageCell
        
        cell.message = self.messages[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200.0
    }
}



