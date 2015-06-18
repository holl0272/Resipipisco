//
//  ViewController.swift
//  NetworkingStuff
//
//  Created by Eric Holland on 6/16/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTextView: UITextView!
    
    @IBAction func onDataTapped(sender: AnyObject) {
        getSomeData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func getSomeData() {
        
        let dataUrlStr = "http://mashable.com/stories.json"
        let url = NSURL(string: dataUrlStr)
        
        let session = NSURLSession.sharedSession()
        
        func onCompletion(data: NSData!, response: NSURLResponse!, error: NSError!) {
            
            let str = NSString(data: data, encoding: NSUTF8StringEncoding)!
            
            var e : NSError? = nil
            let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &e) as? NSDictionary
            
            let hotArticles = json?.valueForKey("hot") as? NSArray
            let firstArticle = hotArticles?.objectAtIndex(0) as? NSDictionary
            
            let title = firstArticle?.valueForKey("title") as? NSString
            let excerpt = firstArticle?.valueForKey("excerpt") as? NSString
            
            let result = "The title was \(title!).\n\nIt's about \(excerpt!)."
            
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) {
                self.dataTextView.text = result
            }
        }
        
        let dataTask = session.dataTaskWithURL(url!, completionHandler: onCompletion)
        dataTask.resume()
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onImageTapped(sender: AnyObject) {
        self.getTheImage()
    }
    
    func getTheImage() {
        
        let imageUrlStr = "http://assets.dogtime.com/breed/profile/image/4d37720801061956690021f0/dachshund-dog-breed.jpg"
        let url = NSURL(string: imageUrlStr)
        
        let session = NSURLSession.sharedSession()
        
        func onCompletion(location:NSURL!, response:NSURLResponse!, error:NSError!) {
            println("done getting image data!")
            
            let imageData = NSData(contentsOfURL: location)
            let img = UIImage(data: imageData!)
            
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) {
                self.imageView.image = img
            }
            
        }
        
        let imageTask = session.downloadTaskWithURL(url!, completionHandler: onCompletion)
        imageTask.resume()
        
    }
    
    

}

