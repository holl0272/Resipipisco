//
//  FavoriteInspirationViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/19/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class FavoriteInspirationViewController: UIViewController, UITabBarDelegate {
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    var pointer:Int = 0
    
    var id:Int = 0
    var index:Int = -1
    var firstIndex:Int = -1
    var randomIndex:Int = 0
    
    var quotes = []
    var quotesJSON: NSDictionary = [:]
    var jsonCount:Int = 0
    var viewedQuotes = [Int]()
    var favoriteIDsArray = [Int]()
    
    var quoteIDsArray = [Int]()
    var favQuoteIDsArray = [Int]()
    
    var favCountString:String = ""
    
    @IBOutlet weak var noFavsView: UIView!
    
    @IBOutlet weak var favCountvTotal: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var favoritesButton: UITabBarItem!
    @IBOutlet weak var removeFavButton: UITabBarItem!
    
    @IBAction func getInspiredButton(sender: UIButton) {
        self.performSegueWithIdentifier("ReturnToTableView", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favorite Inspiration"
        
        self.tabBar.delegate = self
        
        let tabArray = self.tabBar.items as NSArray!
        let tabItem = tabArray.objectAtIndex(0) as! UITabBarItem
        tabBar.selectedItem = tabItem
        
        // Do any additional setup after loading the view.
        
        loadFavoritesFromDefaults()
        
        favCountString = String(favoriteIDsArray.count)
        
        favoritesButton.badgeValue = favCountString
        
        if(favoriteIDsArray.count == 0) {
            self.noFavsView.hidden = false
        }
        else {
            self.favCountvTotal.text = "\(pointer + 1) of \(favCountString)"
            getSomeData("Left")
        }
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        if(item.tag == 1) {
            let alertController = UIAlertController(title: "Favorites", message:
                "Are you sure you want to remove this quote from your favorite inspirations?", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default,handler: nil))
            alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default,handler: removeFromFavorites))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func removeFromFavorites(alert: UIAlertAction!) {
        println("Removed \(id) from favs: \(favoriteIDsArray)")
        removeFavoritesFromDefaults()
    }
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                
                if(pointer > 0) {
                    pointer--
                    getSomeData("Right")
                }
                
            case UISwipeGestureRecognizerDirection.Left:
                
                var lastIndex = jsonCount - 1
                
                if(pointer < lastIndex) {
                    pointer++
                    getSomeData("Left")
                }
                
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
            let dataUrlStr = "http://www.solaris.solutions/admin/iOS/inspiration.json"
            let url = NSURL(string: dataUrlStr)
            
            let session = NSURLSession.sharedSession()
            
            func onCompletion(data: NSData!, response: NSURLResponse!, error: NSError!) {
                
                if(firstIndex == -1) {
                
                  var e : NSError? = nil
                  var externalJSON = NSJSONSerialization.JSONObjectWithData(
                    data, options: NSJSONReadingOptions.MutableContainers,
                    error: &e
                    ) as? NSDictionary
                
                  quotes = (externalJSON?.valueForKey("quotes") as? NSArray)!
                
                  for (var q = 0; q < quotes.count; q++) {
                    var tempID:Int!
                    var quote = quotes.objectAtIndex(q) as? NSDictionary
                    var quoteID = quote?.valueForKey("id") as? String
                    if let quoteID = NSNumberFormatter().numberFromString(quoteID!) {
                        tempID = Int(quoteID)
                    }
                    if(contains(favoriteIDsArray, tempID)){
                        favQuoteIDsArray.append(q)
                    }
                  }
                    
                }
                
                jsonCount = favQuoteIDsArray.count
                
                println("jsonCount: \(jsonCount)")
                
                println("quotes Index: \(favQuoteIDsArray)")
                
                println("favs ids: \(favoriteIDsArray)")
                
                var jsonIndexOfPointer = favQuoteIDsArray[pointer]
                
                println("jsonIndexOfPointer: \(jsonIndexOfPointer)")
                
                if(direction == "Left") {
                    
                    if(firstIndex == -1) {
                        viewedQuotes.append(jsonIndexOfPointer)
                        firstIndex = jsonIndexOfPointer
                        index = jsonIndexOfPointer
                    }
                    else {
                        if(pointer == viewedQuotes.count) {
                            viewedQuotes.append(jsonIndexOfPointer)
                        }
                        
                        index = viewedQuotes[pointer]
                    }
                }
                else {
                    index = viewedQuotes[pointer]
                }
                
                println("pointer \(pointer)")
                println("index: \(index)")
                println("viewed: \(viewedQuotes)")
                println("favID: \(favoriteIDsArray)")
                
                let selectedQuote = quotes.objectAtIndex(index) as? NSDictionary
                
                let text = selectedQuote?.valueForKey("quote") as! String
                let by = selectedQuote?.valueForKey("author") as! String
                var jsonID = selectedQuote?.valueForKey("id") as! String!
                
                if let indexID = NSNumberFormatter().numberFromString(jsonID) {
                    id = Int(indexID)
                }
                
                //let result = "ID: \(id)\nINDEX: \(index)\n\n\(text) \n\nAuthor: \(by)"
                let result = "\(text) \n\nAuthor: \(by)"
                dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) {
                    self.textView.text = result
                    
                    self.favCountvTotal.text = "\(self.pointer + 1) of \(self.favCountString)"
                }
                
            }
            
            let dataTask = session.dataTaskWithURL(url!, completionHandler: onCompletion)
            dataTask.resume()
            
        }
        else {
            println("Not connected to the internet")
            
            let alertController = UIAlertController(title: "Connectivity", message:
                "Oops, seems like you've lost your connection.\n\nYou can view your favorites as soon as you get a signal", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: returnToTableView))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
    }
    

    
    func returnToTableView(alert: UIAlertAction!) {
        self.performSegueWithIdentifier("ReturnToTableView", sender: self)
        
//        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("InspirationMasterViewController") as! UIViewController
//            self.presentViewController(viewController, animated: false, completion: nil)
    }
    
    func removeFavoritesFromDefaults() {
        
        viewedQuotes = viewedQuotes.filter({$0 != self.index})
        favoriteIDsArray = favoriteIDsArray.filter({$0 != self.id})
        favQuoteIDsArray = favQuoteIDsArray.filter({$0 != self.index})
        self.defaultsMgr.setValue(favoriteIDsArray, forKey:"favoriteIDs")
        
        jsonCount--
        
        println("jsonCount: \(jsonCount)")
        
        favoritesButton.badgeValue = String(jsonCount)
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        
        if(jsonCount > 0) {
            
            let tabArray = self.tabBar.items as NSArray!
            let tabItem = tabArray.objectAtIndex(0) as! UITabBarItem
            tabBar.selectedItem = tabItem
            
            if(pointer != 0) {
                pointer--
                index = viewedQuotes[pointer]
            }
            else {
                index = favQuoteIDsArray[pointer]
                viewedQuotes.append(index)
            }
            
            println("pointer after delete: \(pointer)")
            println("viewed quotes after delete: \(viewedQuotes)")
            
            println("new pointer \(pointer)")
            println("new index: \(index)")
            println("viewed: \(viewedQuotes)")
            println("favID: \(favoriteIDsArray)")
            
            let selectedQuote = quotes.objectAtIndex(index) as? NSDictionary
            
            let text = selectedQuote?.valueForKey("quote") as! String
            let by = selectedQuote?.valueForKey("author") as! String
            var jsonID = selectedQuote?.valueForKey("id") as! String!
            
            if let indexID = NSNumberFormatter().numberFromString(jsonID) {
                id = Int(indexID)
            }
            
            //let result = "ID: \(id)\nINDEX: \(index)\n\n\(text) \n\nAuthor: \(by)"
            let result = "\(text) \n\nAuthor: \(by)"
            
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) {
                self.textView.text = result
                self.favCountString = String(self.favoriteIDsArray.count)
                self.favCountvTotal.text = "\(self.pointer + 1) of \(self.favCountString)"
            }
            
        }
        else {
            self.performSegueWithIdentifier("ReturnToTableView", sender: self)
        }
        
    }
    
    func loadFavoritesFromDefaults() {
        if let favoriteIDsIndexArray = self.defaultsMgr.valueForKey("favoriteIDs") as? [Int] {
            
            var sortedArray = sorted(favoriteIDsIndexArray, {
                (str1: Int, str2: Int) -> Bool in
                return str1 < str2
            })
            
            self.favoriteIDsArray = sortedArray
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
