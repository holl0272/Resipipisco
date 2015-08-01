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
    
    var pointer:Int = 0
    
    var id:Int = 0
    var index:Int = -1
    var firstIndex:Int = -1
    var randomIndex:Int = 0
    
    var jsonCount:Int = 0
    var viewedQuotes = [Int]()
    
    var favoritesArray = [Int]()
    var favoriteIDsArray = [Int]()
    
    var bookmarkButton = UIBarButtonItem()
    var removeBookmark = UIBarButtonItem()
        
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadFavoritesFromDefaults()
        loadFavoriteIDsFromDefaults()
        
        bookmarkButton = UIBarButtonItem(barButtonSystemItem: .Bookmarks, target: self, action: "addToFavorites")
        
        removeBookmark = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "removeFromFavorites")
        
        self.navigationItem.rightBarButtonItem = bookmarkButton
        
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
        saveInDefaults(index, favID: id)
        println("Added \(index) to favs: \(favoritesArray)")
        println("Added \(id) to favIDs: \(favoriteIDsArray)")
    }
    
    func removeFromFavorites() {
        navigationItem.rightBarButtonItem = bookmarkButton
        removeFavoritesFromDefaults(index, favID: id)
        println("Removed \(index) from favs: \(favoritesArray)")
        println("Removed \(id) from favIDs: \(favoriteIDsArray)")
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
    
    func checkFavArray(favID:Int) {
        if contains(favoriteIDsArray, favID) {
            println("\(favID) in favs")
            dispatch_async(dispatch_get_main_queue()) {
                self.navigationItem.rightBarButtonItem = self.removeBookmark
            }
        }
        else {
            println("\(favID) NOT in favs")
            dispatch_async(dispatch_get_main_queue()) {
                self.navigationItem.rightBarButtonItem = self.bookmarkButton
            }
        }
    }
    
    func getSomeData(direction:String) {
        
        var hasInternetConnection:Bool = Reachability.isConnectedToNetwork()
        
        if(hasInternetConnection) {
            let dataUrlStr = "http://www.solaris.solutions/admin/iOS/inspiration.json"
            let url = NSURL(string: dataUrlStr)
            
            let session = NSURLSession.sharedSession()
            
            func onCompletion(data: NSData!, response: NSURLResponse!, error: NSError!) {
                
                var e : NSError? = nil
                var externalJSON = NSJSONSerialization.JSONObjectWithData(
                    data, options: NSJSONReadingOptions.MutableContainers,
                    error: &e
                    ) as? NSDictionary
                
                let quotes = externalJSON?.valueForKey("quotes") as? NSArray
                                
                let count:Int = quotes!.count
                jsonCount = count
                
                if(direction == "Left") {
                    
                    println("c: \(viewedQuotes.count)")
                    println("j: \(jsonCount)")
                    
                    if(viewedQuotes.count < jsonCount) {
                        
                        randomIndex = Int(arc4random_uniform(UInt32(count)))
                        
                        while(contains(viewedQuotes, randomIndex)) {
                            println("random and index match")
                            randomIndex = Int(arc4random_uniform(UInt32(count)))
                        }
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
                println("index: \(index)")
                println("viewed: \(viewedQuotes)")
                println("favID: \(favoriteIDsArray)")
                println("favIndex: \(favoritesArray)")
                
                let selectedQuote = quotes?.objectAtIndex(index) as? NSDictionary
                
                let text = selectedQuote?.valueForKey("quote") as! String
                let by = selectedQuote?.valueForKey("author") as! String
                var jsonID = selectedQuote?.valueForKey("id") as! String!
                
                if let indexID = NSNumberFormatter().numberFromString(jsonID) {
                    id = Int(indexID)
                }
                
                let result = "ID: \(id)\nINDEX: \(index)\n\n\(text) \n\nAuthor: \(by)"
                
                dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) {
                    self.textView.text = result
                }
                
                checkFavArray(id)
                
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
                let quotes = quotesJSON.valueForKey("quotes") as? NSArray
                let count:Int = quotes!.count
                jsonCount = count
                
                if(direction == "Left") {
                    
                    println("c: \(viewedQuotes.count)")
                    println("j: \(jsonCount)")
                    
                    if(viewedQuotes.count < jsonCount) {
                    
                        randomIndex = Int(arc4random_uniform(UInt32(count)))
                    
                        while(contains(viewedQuotes, randomIndex)) {
                            println("random and index match")
                            randomIndex = Int(arc4random_uniform(UInt32(count)))
                        }
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
                println("index: \(index)")
                println("viewed: \(viewedQuotes)")
                println("favID: \(favoriteIDsArray)")
                println("favIndex: \(favoritesArray)")
                
                var quoteText = quotesJSON["quotes"]![index]["quote"] as! String
                var quoteAuthor = quotesJSON["quotes"]![index]["author"] as! String
                var quoteID = quotesJSON["quotes"]![index]["id"] as! String
                
                if let indexID = NSNumberFormatter().numberFromString(quoteID) {
                    id = Int(indexID)
                }
                
                self.textView.text! = "ID: \(id)\nINDEX: \(index)\n\n\(quoteText) \n\nBy: \(quoteAuthor)"
                
                checkFavArray(id)
                
            }
            
        }
        
    }
    
    func saveInDefaults(favIndex: Int, favID: Int) {
        favoritesArray.append(favIndex)
        self.defaultsMgr.setValue(favoritesArray, forKey:"favorites")
        favoriteIDsArray.append(favID)
        self.defaultsMgr.setValue(favoriteIDsArray, forKey:"favoriteIDs")

        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
    }
    
//    func saveInDefaults(favIndex: Int) {
//        favoritesArray.append(favIndex)
//        self.defaultsMgr.setValue(favoritesArray, forKey:"favorites")
//    }
//
//    func saveIdInDefaults(favID: Int) {
//        favoriteIDsArray.append(favID)
//        self.defaultsMgr.setValue(favoritesArray, forKey:"favoriteIDs")
//    }

    func removeFavoritesFromDefaults(favIndex: Int, favID: Int) {
        favoritesArray = favoritesArray.filter({$0 != favIndex})
        self.defaultsMgr.setValue(favoritesArray, forKey:"favorites")
        favoriteIDsArray = favoriteIDsArray.filter({$0 != favID})
        self.defaultsMgr.setValue(favoriteIDsArray, forKey:"favoriteIDs")
        
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
    }
    
//    func removeFavoritesFromDefaults(favIndex: Int) {
//        favoritesArray = favoritesArray.filter({$0 != favIndex})
//        self.defaultsMgr.setValue(favoritesArray, forKey:"favorites")
//    }
    
    func loadFavoritesFromDefaults() {
        if let favoritesIndexArray = self.defaultsMgr.valueForKey("favorites") as? [Int] {
            self.favoritesArray = favoritesIndexArray
        }
    }

    func loadFavoriteIDsFromDefaults() {
        if let favoriteIDsIndexArray = self.defaultsMgr.valueForKey("favoriteIDs") as? [Int] {
            self.favoriteIDsArray = favoriteIDsIndexArray
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
