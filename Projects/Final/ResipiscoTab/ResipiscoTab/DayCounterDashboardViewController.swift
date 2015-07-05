//
//  DayCounterDashboardViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/20/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class DayCounterDashboardViewController: UIViewController {
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    var sobrietyDate:String = ""
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var sobrietyDateLabel: UILabel!
    
    @IBOutlet weak var secondsCounter: UILabel!
    @IBOutlet weak var minutesCounter: UILabel!
    @IBOutlet weak var hoursCounter: UILabel!
    @IBOutlet weak var daysCounter: UILabel!
    @IBOutlet weak var weeksCounter: UILabel!
    @IBOutlet weak var monthsCounter: UILabel!
    @IBOutlet weak var yearsCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let name = self.defaultsMgr.valueForKey("name") as? String {
            self.greetingLabel.text! = "Hi, \(name)!"
        }
        
        if let savedDate = self.defaultsMgr.valueForKey("soberDate") as? String {
            self.sobrietyDate = savedDate
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "M/d/yy"
            let date = dateFormatter.dateFromString(savedDate)
            
            self.sobrietyDateLabel.text! = printDate(date!)
        }
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "M/d/yy"
        
        var sobrietyDateNS = dateFormatter.dateFromString(self.sobrietyDate)
        
        var elapsedTime = NSDate().timeIntervalSinceDate(sobrietyDateNS!)
        //millisecond
        var elapsedMillisecondsFloat:Double = elapsedTime / 1000
        var elapsedMilliseconds:Int = Int(elapsedMillisecondsFloat)
        //seconds
        var elapsedSeconds:Int = Int(elapsedTime)
        //minutes
        var elapsedMinutesFloat:Double = elapsedTime / 60
        var elapsedMinutes:Int = Int(elapsedMinutesFloat)
        //hours
        var elapsedHoursFloat:Double = elapsedTime * 0.000277778
        var elapsedHours:Int = Int(elapsedHoursFloat)
        //days
        var elapsedDaysFloat:Double = elapsedTime * 0.0000115741
        var elapsedDays:Int = Int(elapsedDaysFloat)
        //weeks
        var elapsedWeeksFloat:Double = elapsedTime * 1.6534E-6
        var elapsedWeeks:Int = Int(elapsedWeeksFloat)
        //months
        var elapsedMonthsFloat:Double = elapsedTime * 3.8027E-7
        var elapsedMonths:Int = Int(elapsedMonthsFloat)
        //years
        var elapsedYearsFloat:Double = elapsedTime * 3.1689E-8
        var elapsedYears:Int = Int(elapsedYearsFloat)

        self.secondsCounter.text = "\(elapsedSeconds)"
        self.minutesCounter.text = "\(elapsedMinutes)"
        self.hoursCounter.text = "\(elapsedHours)"
        self.daysCounter.text = "\(elapsedDays)"
        self.weeksCounter.text = "\(elapsedWeeks)"
        self.monthsCounter.text = "\(elapsedMonths)"
        self.yearsCounter.text = "\(elapsedYears)"
        
        var secondsTimer = NSTimer()
        secondsTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateSeconds"), userInfo: nil, repeats: true)

        var minutesTimer = NSTimer()
        minutesTimer = NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: Selector("updateMinutes"), userInfo: nil, repeats: true)
    }

    func updateSeconds() {
        var counter:Int = self.secondsCounter.text!.toInt()!
        counter = counter + 1
        self.secondsCounter.text = "\(counter)"
    }
    
    func updateMinutes() {
        var counter:Int = self.minutesCounter.text!.toInt()!
        counter = counter + 1
        self.minutesCounter.text = "\(counter)"
    }
    
    func printDate(date:NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        
        var theDateFormat = NSDateFormatterStyle.LongStyle
        
        dateFormatter.dateStyle = theDateFormat
        
        return dateFormatter.stringFromDate(date)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
