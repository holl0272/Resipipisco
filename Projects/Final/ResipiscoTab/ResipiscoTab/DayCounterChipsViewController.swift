//
//  DayCounterChipsViewController.swift
//  ResipiscoTab
//
//  Created by Eric Holland on 6/20/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class DayCounterChipsViewController: UIViewController {
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    //let currentDate = NSDate()
    
    let currentDate = NSCalendar.currentCalendar().startOfDayForDate(NSDate())
    
    var sobrietyDate:String = ""

    @IBOutlet weak var _24hr_label: UILabel!
    @IBOutlet weak var _24hr_chip: UIImageView!
    @IBOutlet weak var bw_24hr_chip: UIImageView!
    
    @IBOutlet weak var _1mo_label: UILabel!
    @IBOutlet weak var _1mo_chip: UIImageView!
    @IBOutlet weak var bw_1mo_chip: UIImageView!
    
    @IBOutlet weak var _2mo_label: UILabel!
    @IBOutlet weak var _2mo_chip: UIImageView!
    @IBOutlet weak var bw_2mo_chip: UIImageView!
    
    @IBOutlet weak var _3mo_label: UILabel!
    @IBOutlet weak var _3mo_chip: UIImageView!
    @IBOutlet weak var bw_3mo_chip: UIImageView!
    
    @IBOutlet weak var _6mo_label: UILabel!
    @IBOutlet weak var _6mo_chip: UIImageView!
    @IBOutlet weak var bw_6mo_chip: UIImageView!
    
    @IBOutlet weak var _9mo_label: UILabel!
    @IBOutlet weak var _9mo_chip: UIImageView!
    @IBOutlet weak var bw_9mo_chip: UIImageView!
    
    @IBOutlet weak var _1yr_label: UILabel!
    @IBOutlet weak var _1yr_chip: UIImageView!
    @IBOutlet weak var bw_1yr_chip: UIImageView!
    
    @IBOutlet weak var _2yr_label: UILabel!
    @IBOutlet weak var _2yr_chip: UIImageView!
    @IBOutlet weak var bw_2yr_chip: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let savedDate = self.defaultsMgr.valueForKey("soberDate") as? String {
            self.sobrietyDate = savedDate
        }
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "M/d/yy"
        
        var sobrietyDateNS = dateFormatter.dateFromString(self.sobrietyDate)
        
//        println("current: \(currentDate)")
//        println("sober: \(sobrietyDateNS!)")
        
        var in_24hrs = addDays(sobrietyDateNS!, additionalDays: 1)
        var in_1mo = addDays(sobrietyDateNS!, additionalDays: 30)
        var in_2mos = addDays(sobrietyDateNS!, additionalDays: 60)
        var in_3mos = addDays(sobrietyDateNS!, additionalDays: 90)
        var in_6mos = addDays(sobrietyDateNS!, additionalDays: 180)
        var in_9mos = addDays(sobrietyDateNS!, additionalDays: 270)
        var in_1yr = addDays(sobrietyDateNS!, additionalDays: 365)
        var in_2yrs = addDays(sobrietyDateNS!, additionalDays: 730)
        
        //24hrs
        if currentDate.compare(in_24hrs) == NSComparisonResult.OrderedDescending {
            println("currentDate after 24hr sober");
            self._24hr_chip.hidden = false
            self.bw_24hr_chip.hidden = true
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            self._24hr_label.text! = dateFormatter.stringFromDate(in_24hrs)
        }
        else if currentDate.compare(in_24hrs) == NSComparisonResult.OrderedAscending {
            println("currentDate before 24hr sober");
            self._24hr_chip.hidden = true
            self.bw_24hr_chip.hidden = false
            
            var days_to_24hr = diffDays(in_24hrs)
            self._24hr_label.text! = "In \(days_to_24hr) days!"
        }
        else {
            println("current and 24hr sober are equal");
            self._24hr_chip.hidden = false
            self.bw_24hr_chip.hidden = true
            self._24hr_label.text! = "TODAY!!!"
        }
        
    
        //1mo
        if currentDate.compare(in_1mo) == NSComparisonResult.OrderedDescending {
            println("currentDate after 1mo sober");
            self._1mo_chip.hidden = false
            self.bw_1mo_chip.hidden = true
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            self._1mo_label.text! = dateFormatter.stringFromDate(in_1mo)
        }
        else if currentDate.compare(in_1mo) == NSComparisonResult.OrderedAscending {
            println("currentDate before 1mo sober");
            self._1mo_chip.hidden = true
            self.bw_1mo_chip.hidden = false
            
            var days_to_1mo = diffDays(in_1mo)
            self._1mo_label.text! = "In \(days_to_1mo) days!"
        }
        else {
            println("current and 1mo are equal");
            self._1mo_chip.hidden = false
            self.bw_1mo_chip.hidden = true
            self._1mo_label.text! = "TODAY!!!"
        }

        //2mos
        if currentDate.compare(in_2mos) == NSComparisonResult.OrderedDescending {
            println("currentDate after 2mos sober");
            self._2mo_chip.hidden = false
            self.bw_2mo_chip.hidden = true
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            self._2mo_label.text! = dateFormatter.stringFromDate(in_2mos)
        }
        else if currentDate.compare(in_2mos) == NSComparisonResult.OrderedAscending {
            println("currentDate before 2mos sober");
            self._2mo_chip.hidden = true
            self.bw_2mo_chip.hidden = false
            
            var days_to_2mos = diffDays(in_2mos)
            self._2mo_label.text! = "In \(days_to_2mos) days!"
        }
        else {
            println("current and 2mos are equal");
            self._2mo_chip.hidden = false
            self.bw_2mo_chip.hidden = true
            self._2mo_label.text! = "TODAY!!!"
        }

        //3mos
        if currentDate.compare(in_3mos) == NSComparisonResult.OrderedDescending {
            println("currentDate after 3mos sober");
            self._3mo_chip.hidden = false
            self.bw_3mo_chip.hidden = true
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            self._3mo_label.text! = dateFormatter.stringFromDate(in_3mos)
        }
        else if currentDate.compare(in_3mos) == NSComparisonResult.OrderedAscending {
            println("currentDate before 3mos sober");
            self._3mo_chip.hidden = true
            self.bw_3mo_chip.hidden = false
            
            var days_to_3mos = diffDays(in_3mos)
            self._3mo_label.text! = "In \(days_to_3mos) days!"
        }
        else {
            println("current and 3mos are equal");
            self._3mo_chip.hidden = false
            self.bw_3mo_chip.hidden = true
            self._3mo_label.text! = "TODAY!!!"
        }

        //6mos
        if currentDate.compare(in_6mos) == NSComparisonResult.OrderedDescending {
            println("currentDate after 6mos sober");
            self._6mo_chip.hidden = false
            self.bw_6mo_chip.hidden = true
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            self._6mo_label.text! = dateFormatter.stringFromDate(in_6mos)
        }
        else if currentDate.compare(in_6mos) == NSComparisonResult.OrderedAscending {
            println("currentDate before 6mos sober");
            self._6mo_chip.hidden = true
            self.bw_6mo_chip.hidden = false
            
            var days_to_6mos = diffDays(in_6mos)
            self._6mo_label.text! = "In \(days_to_6mos) days!"
        }
        else {
            println("current and 6mos are equal");
            self._6mo_chip.hidden = false
            self.bw_6mo_chip.hidden = true
            self._6mo_label.text! = "TODAY!!!"
        }

        //9mos
        if currentDate.compare(in_9mos) == NSComparisonResult.OrderedDescending {
            println("currentDate after 9mos sober");
            self._9mo_chip.hidden = false
            self.bw_9mo_chip.hidden = true
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            self._9mo_label.text! = dateFormatter.stringFromDate(in_9mos)
        }
        else if currentDate.compare(in_9mos) == NSComparisonResult.OrderedAscending {
            println("currentDate before 9mos sober");
            self._9mo_chip.hidden = true
            self.bw_9mo_chip.hidden = false
            
            var days_to_9mos = diffDays(in_9mos)
            self._9mo_label.text! = "In \(days_to_9mos) days!"
        }
        else {
            println("current and 9mos are equal");
            self._9mo_chip.hidden = false
            self.bw_9mo_chip.hidden = true
            self._9mo_label.text! = "TODAY!!!"
        }

        //1yr
        if currentDate.compare(in_1yr) == NSComparisonResult.OrderedDescending {
            println("currentDate after 1yr sober");
            self._1yr_chip.hidden = false
            self.bw_1yr_chip.hidden = true
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            self._1yr_label.text! = dateFormatter.stringFromDate(in_1yr)
        }
        else if currentDate.compare(in_1yr) == NSComparisonResult.OrderedAscending {
            println("currentDate before 1yr sober");
            self._1yr_chip.hidden = true
            self.bw_1yr_chip.hidden = false
            
            var days_to_1yr = diffDays(in_1yr)
            self._1yr_label.text! = "In \(days_to_1yr) days!"
        }
        else {
            println("current and 1yr are equal");
            self._1yr_chip.hidden = false
            self.bw_1yr_chip.hidden = true
            self._1yr_label.text! = "TODAY!!!"
        }

        //2yrs
        if currentDate.compare(in_2yrs) == NSComparisonResult.OrderedDescending {
            println("currentDate after 2yrs sober");
            self._2yr_chip.hidden = false
            self.bw_2yr_chip.hidden = true
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            self._2yr_label.text! = dateFormatter.stringFromDate(in_2yrs)
        }
        else if currentDate.compare(in_2yrs) == NSComparisonResult.OrderedAscending {
            println("currentDate before 2yrs sober");
            self._2yr_chip.hidden = true
            self.bw_2yr_chip.hidden = false
            
            var days_to_2yrs = diffDays(in_2yrs)
            self._2yr_label.text! = "In \(days_to_2yrs) days!"
        }
        else {
            println("current and 2yrs are equal");
            self._2yr_chip.hidden = false
            self.bw_2yr_chip.hidden = true
            self._2yr_label.text! = "TODAY!!!"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func addDays(date: NSDate, additionalDays: Int) -> NSDate {
        // adding $additionalDays
        var components = NSDateComponents()
        components.day = additionalDays
        
        // important: NSCalendarOptions(0)
        let futureDate = NSCalendar.currentCalendar()
            .dateByAddingComponents(components, toDate: date, options: NSCalendarOptions(0))
        return futureDate!
    }
    
    func diffDays(date: NSDate) -> Int {
        let cal = NSCalendar.currentCalendar()
        let today = cal.startOfDayForDate(NSDate())
        let dayAndMonth = cal.components(.CalendarUnitDay | .CalendarUnitMonth, fromDate: date)
        let nextBirthDay = cal.nextDateAfterDate(today, matchingComponents: dayAndMonth, options: .MatchNextTimePreservingSmallerUnits)!
        
        var diff = cal.components(.CalendarUnitDay, fromDate: today, toDate: nextBirthDay, options: nil)
        
        return diff.day
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
