//
//  InspirationViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/8/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class InspirationViewController: UIViewController {
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    var firstIndex:Int = -1
    
    var randomIndex:Int = 0
    
    var pointer:Int = 0
    var viewedQuotes = [Int]()
    
    var favoritesArray = [Int]()
    
    var bookmarkButton = UIBarButtonItem()
    var removeBookmark = UIBarButtonItem()
    
    @IBAction func returnFromInspiration(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("returnFromInspiration", sender: self)
    }
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bookmarkButton = UIBarButtonItem(barButtonSystemItem: .Bookmarks, target: self, action: "addToFavorites")
        
        removeBookmark = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "removeFromFavorites")
        
        navigationItem.rightBarButtonItem = bookmarkButton
        
        title = "Inspiration"
        
        getSomeData("Left")
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
            var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
            swipeRight.direction = UISwipeGestureRecognizerDirection.Right
            self.view.addGestureRecognizer(swipeRight)
    }
    
    func addToFavorites() {
        navigationItem.rightBarButtonItem = removeBookmark
        saveInDefaults(randomIndex)
        println("Added \(randomIndex) to favs: \(favoritesArray)")
    }
    
    func removeFromFavorites() {
        navigationItem.rightBarButtonItem = bookmarkButton
        loadFavoritesFromDefaults()
        println("Removed \(randomIndex) from favs: \(favoritesArray)")
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if contains(favoritesArray, randomIndex) {
          navigationItem.rightBarButtonItem = removeBookmark
        }
        else {
           navigationItem.rightBarButtonItem = bookmarkButton
        }
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
        
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                if(pointer > 0) {
                    pointer--
                    getSomeData("Right")
                }
            case UISwipeGestureRecognizerDirection.Left:
                    pointer++
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
                
            if(direction == "Left") {
                
                randomIndex = Int(arc4random_uniform(UInt32(count)))
                
                while(contains(viewedQuotes, randomIndex)) {
                    println("random and index match")
                    randomIndex = Int(arc4random_uniform(UInt32(count)))
                }
                
                if(firstIndex == -1) {
                    viewedQuotes.append(randomIndex)
                    firstIndex = randomIndex
                    index = randomIndex
                }
                else {
                    if(pointer == viewedQuotes.count) {
                        viewedQuotes.append(randomIndex)
                    }
                    index = viewedQuotes[pointer]
                }
            }
            else {
                index = viewedQuotes[pointer]
            }
                
            println("pointer \(pointer)")

            println(viewedQuotes)

            let selectedQuote = quotes?.objectAtIndex(index) as? NSDictionary
                
            let text = selectedQuote?.valueForKey("quote") as! String
            let by = selectedQuote?.valueForKey("author") as! String
                    
            let result = "INDEX: \(index)\n\n \(text) \n\nAuthor: \(by)"
                    
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) {
                self.textView.text = result
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
                
                var quoteText = quotesJSON["quotes"]![randomIndex]["quote"] as! String
                var quoteAuthor = quotesJSON["quotes"]![randomIndex]["author"] as! String

                println(quoteText)
                println(quoteAuthor)
                
                self.textView.text! = "\(quoteText) \n\nBy: \(quoteAuthor)"
            }
            
        }

    }
    
    func saveInDefaults(favIndex: Int) {
        favoritesArray.append(favIndex)
        self.defaultsMgr.setValue(favoritesArray, forKey:"favorites")
    }
    
    func loadFavoritesFromDefaults() {
        if let favoritesIndexArray = self.defaultsMgr.valueForKey("favorites") as? [Int] {
            self.favoritesArray = favoritesIndexArray
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
