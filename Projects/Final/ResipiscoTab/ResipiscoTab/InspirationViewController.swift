//
//  InspirationViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/8/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class InspirationViewController: UIViewController {
    
    var tempIndex:Int = -1
    var firstIndex:Int = -1
    var randomIndex:Int = 0
    
    var viewedQuotes = [Int]()
    
    @IBAction func returnFromInspiration(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("returnFromInspiration", sender: self)
    }
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "Inspiration"
        
        getSomeData("Left")
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
            var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
            swipeRight.direction = UISwipeGestureRecognizerDirection.Right
            self.view.addGestureRecognizer(swipeRight)

        
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                                    println("Swiped right: \(tempIndex)")
                if(tempIndex != -1) {

                            getSomeData("Right")
                }
            case UISwipeGestureRecognizerDirection.Left:
                println("Swiped left: \(tempIndex)")
                        getSomeData("Left")
            default:
                break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSomeData(direction:String) {
        println("Getting JSON from the internet")
        
        var hasInternetConnection:Bool = Reachability.isConnectedToNetwork()
        
        if(hasInternetConnection) {
            let dataUrlStr = "http://www.solaris.solutions/admin/iOS/quotes.json"
            let url = NSURL(string: dataUrlStr)
            
            let session = NSURLSession.sharedSession()
            
            func onCompletion(data: NSData!, response: NSURLResponse!, error: NSError!) {
                println("DONE!")
                
                var e : NSError? = nil
                var externalJSON = NSJSONSerialization.JSONObjectWithData(
                    data, options: NSJSONReadingOptions.MutableContainers,
                    error: &e
                    ) as? NSDictionary
                
                let quotes = externalJSON?.valueForKey("quotes") as? NSArray
                let count:Int = quotes!.count
                
                var index:Int = 0
                var proceed:Bool = true
                
            if(direction == "Left") {
                
                randomIndex = Int(arc4random_uniform(UInt32(count)))
                
                println("a: \(randomIndex)")
                
                while(randomIndex == tempIndex) {
                    println("random and index match")
                    randomIndex = Int(arc4random_uniform(UInt32(count)))
                }
                
                println("b: \(randomIndex)")

                tempIndex = randomIndex
                
                if(firstIndex == -1) {
                   firstIndex = randomIndex
                }

                viewedQuotes.append(randomIndex)
                
                index = randomIndex
            }
            else {
                if(tempIndex != -1) {
                    
                    println("count: \(viewedQuotes.count)")
                    var lastIndex:Int = viewedQuotes.count - 1
                    println("lastIndex: \(lastIndex)")
                    if(lastIndex > 0) {
                        viewedQuotes.removeAtIndex(lastIndex)
                        index = viewedQuotes[viewedQuotes.count - 1]
                    }
                    else {
                        tempIndex = -1
                        index = viewedQuotes[0]
                    }
                }
                else {
                    proceed = false
                }

            }
                
                println(viewedQuotes)
                
                if(proceed) {
                    let selectedQuote = quotes?.objectAtIndex(index) as? NSDictionary
                    
                    let text = selectedQuote?.valueForKey("text") as! String
                    let by = selectedQuote?.valueForKey("by") as! String
                    
                    let result = "\(text) \n\nBy: \(by)"
                    
                    dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) {
                        self.textView.text = result
                    }
                }

            }
            
            let dataTask = session.dataTaskWithURL(url!, completionHandler: onCompletion)
            dataTask.resume()
        }
        else {
            println("Not connected to the internet")
            
            let filePath = NSBundle.mainBundle().pathForResource("quotes",ofType:"json")
            var readError:NSError?
            if let data = NSData(contentsOfFile:filePath!, options:NSDataReadingOptions.DataReadingUncached, error:&readError) {

                func parseJSON(inputData: NSData) -> NSDictionary{
                    var error: NSError?
                    var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
                    return boardsDictionary
                }
                
                var quotesJSON = parseJSON(data)
                
                var randomIndex = Int(arc4random_uniform(UInt32(3)))
                
                var quoteText = quotesJSON["quotes"]![randomIndex]["text"] as! String
                var quoteAuthor = quotesJSON["quotes"]![randomIndex]["by"] as! String

                println(quoteText)
                println(quoteAuthor)
                
                self.textView.text! = "\(quoteText) \n\nBy: \(quoteAuthor)"
            }
            
        }

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
