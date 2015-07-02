//
//  ViewController.swift
//  NetworkingTesting
//
//  Created by William Martin on 6/15/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

// http://www.raywenderlich.com/79149/grand-central-dispatch-tutorial-swift-part-1

var GlobalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}

//QOS_CLASS_USER_INTERACTIVE: The user interactive class represents tasks that need
//to be done immediately in order to provide a nice user experience. Use it for UI
//updates, event handling and small workloads that require low latency. The total
//amount of work done in this class during the execution of your app should be small.
var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.value), 0)
}

//QOS_CLASS_USER_INITIATED: The user initiated class represents tasks that are initiated
//from the UI and can be performed asynchronously. It should be used when the user is
//waiting for immediate results, and for tasks required to continue user interaction.
var GlobalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.value), 0)
}

//QOS_CLASS_UTILITY: The utility class represents long-running tasks, typically with a
//user-visible progress indicator. Use it for computations, I/O, networking, continous
//data feeds and similar tasks. This class is designed to be energy efficient.
var GlobalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.value), 0)
}

//QOS_CLASS_BACKGROUND: The background class represents tasks that the user is not directly
//aware of. Use it for prefetching, maintenance, and other tasks that don’t require user
//interaction and aren’t time-sensitive.
var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.value), 0)
}


class ViewController: UIViewController {
    
    @IBOutlet var downloadImageView: UIImageView!
    @IBOutlet var downloadDataView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onGetImageTapped(sender:AnyObject) {
        self.getTheImage()
    }
    
    func getTheImage() {
        println("Attempting to download an image!")
        
        let urlStr = "https://ga-core-production-herokuapp-com.global.ssl.fastly.net/assets/course_icons/MOB-582372ee1d626d37ef7b8ee70be05b7c.png"
        let url = NSURL(string: urlStr)
        
        let session = NSURLSession.sharedSession()
        
        func onCompletion(location:NSURL!, response:NSURLResponse!, error:NSError!) {
            println("Done getting image!")
            
            let imageData = NSData(contentsOfURL: location)
            let img = UIImage(data: imageData!)

            dispatch_after(DISPATCH_TIME_NOW, GlobalMainQueue) {
                self.downloadImageView.image = img
            }
        }
        
        let downloadTask = session.downloadTaskWithURL(
            url!,
            completionHandler: onCompletion
        )
        
        downloadTask.resume()
    }
    
    
    @IBAction func onGetDataTapped(sender:AnyObject) {
        self.getSomeData()
    }
    
    func getStringFromData(data: NSData) -> String {
        if let str = NSString(data: data, encoding: NSUTF8StringEncoding) {
            return str as String
        } else {
            return "???"
        }
    }
    
    func getSomeData() {
        println("Attempting to download some data!")
        
        let dataUrlStr = "http://mashable.com/stories.json"
        let url = NSURL(string: dataUrlStr)
        
        let session = NSURLSession.sharedSession()
        
        func onCompletion(data: NSData!, response: NSURLResponse!, error: NSError!) {
            println("Done getting data!")
            
            if let _error = error {
                println("ERROR getting data!")
                return
            }
            
            let dataStr = self.getStringFromData(data!)
            
            dispatch_after(DISPATCH_TIME_NOW, GlobalMainQueue) {
                self.downloadDataView.text = dataStr
            }
            
        }
        
        let dataTask = session.dataTaskWithURL(url!, completionHandler: onCompletion)
        dataTask.resume()
    }
}

