//
//  RandomInspiration.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 7/16/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import Foundation

class RandomInspiration {
    
    var hasInternetConnection:Bool = Reachability.isConnectedToNetwork()
    
    var randomIndex:Int!
    var quoteText:String!
    var quoteAuthor:String!
    var quoteIDArray = [Int]()
    var inspiration:String = ""
    
    init() {
    
        if(hasInternetConnection == true) {
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
                
                randomIndex = Int(arc4random_uniform(UInt32(count)))
                
                let selectedQuote = quotes?.objectAtIndex(randomIndex!) as? NSDictionary
                
                self.quoteText = selectedQuote?.valueForKey("quote") as? String
                self.quoteAuthor = selectedQuote?.valueForKey("author") as? String
                
                let result:String = "INDEX: \(randomIndex)\n\n \(quoteText) \n\nAuthor: \(quoteAuthor)" as String
                
                self.inspiration = result
                
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
                
                randomIndex = Int(arc4random_uniform(UInt32(count)))
                
                self.quoteText = quotesJSON["quotes"]![randomIndex!]["quote"] as? String
                self.quoteAuthor = quotesJSON["quotes"]![randomIndex!]["author"] as? String
                
                self.inspiration = "INDEX: \(randomIndex)\n\n \(quoteText) \n\nAuthor: \(quoteAuthor)"
                
            }
            
        }

    }
    
    func returnQuote() -> String {
        return "\(self.inspiration)"
    }
    
}