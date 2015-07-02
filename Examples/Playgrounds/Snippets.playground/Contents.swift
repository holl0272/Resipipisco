//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

NSUUID().UUIDString


let viewFrame = CGRect(x:0, y:0, width:1000, height:500)
let view = UIView(frame: viewFrame)
view.backgroundColor = UIColor.grayColor()
view



//NSTimeInterval(
NSDate()
let formatter = NSDateFormatter()
formatter.dateFormat = "yyyy-MM-dd"
let d = formatter.dateFromString("2015-06-01")!
d

let cal = NSCalendar.currentCalendar()
cal.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: 1, toDate: d, options: NSCalendarOptions.allZeros)
cal.dateByAddingUnit(NSCalendarUnit.CalendarUnitWeekOfYear, value: 1, toDate: d, options: NSCalendarOptions.allZeros)
//d.earlierDate(nextWeek!)
//d.compare(nextWeek!) == .OrderedAscending

func numDaysLater(d:NSDate, numDays:Int) -> NSDate {
    return cal.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: numDays, toDate: d, options: NSCalendarOptions.allZeros)!
}

func nextDay(d:NSDate) -> NSDate {
    return cal.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: 1, toDate: d, options: NSCalendarOptions.allZeros)!
}

func prevDay(d:NSDate) -> NSDate {
    return cal.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: -1, toDate: d, options: NSCalendarOptions.allZeros)!
}

func nextWeek(d:NSDate) -> NSDate {
    return cal.dateByAddingUnit(NSCalendarUnit.CalendarUnitWeekOfYear, value: 1, toDate: d, options: NSCalendarOptions.allZeros)!
}

func nextMonth(d:NSDate) -> NSDate {
    return cal.dateByAddingUnit(NSCalendarUnit.CalendarUnitMonth, value: 1, toDate: d, options: NSCalendarOptions.allZeros)!
}

func nextYear(d:NSDate) -> NSDate {
    return cal.dateByAddingUnit(NSCalendarUnit.CalendarUnitYear, value: 1, toDate: d, options: NSCalendarOptions.allZeros)!
}

func isEarlier(a:NSDate, b:NSDate) -> Bool {
    return a.compare(b) == .OrderedAscending
}


enum RepeatInterval {
    case Annually
    case Monthly
    case Weekly
    case Daily
    case None
}

class Repeater {
    var start : NSDate
    var interval : RepeatInterval = .None
    
    var repeats: Bool {
        return self.interval != .None
    }
    
    init(start: NSDate) {
        self.start = start
    }
    
    func getNextOccurrence(fromDate:NSDate) -> NSDate? {
        if self.interval == .Daily {
            return nextDay(fromDate)
        } else if self.interval == .Weekly {
            var date = self.start
            while isEarlier(date, fromDate) {
                date = nextWeek(date)
            }
            return date
        } else if self.interval == .Monthly {
            var date = self.start
            while isEarlier(date, fromDate) {
                date = nextMonth(date)
            }
            return date
        } else if self.interval == .Annually {
            var date = self.start
            while isEarlier(date, fromDate) {
                date = nextYear(date)
            }
            return date
        }
        
        return nil
    }
}

class BudgetItem {
    var amount : Double
    var repeater : Repeater
    
    var start: NSDate {
        return self.repeater.start
    }
    
    var repeats: Bool {
        return self.repeater.repeats
    }
    
    init(amount: Double, start: NSDate) {
        self.amount = amount
        self.repeater = Repeater(start: start)
    }
    
    func getNextOccurrence(fromDate:NSDate) -> NSDate? {
        return self.repeater.getNextOccurrence(fromDate)
    }
    
    func repeatWeekly() {
        self.repeater.interval = .Weekly
    }
}

class Account {
    var initialBalance : Double
    var start : NSDate
    
    var budgetItems : [BudgetItem] = []
    var balances : [NSDate: Double] = [:]

    
    init(initialBalance: Double, start: NSDate) {
        self.initialBalance = initialBalance
        self.start = start
    }
    
    func addBudgetItem(item:BudgetItem) {
        self.budgetItems.append(item)
    }
    
    func recomputeBalances(end: NSDate) {
        self.balances = [self.start: self.initialBalance]
        var previousDate = prevDay(self.start)
        var date = self.start
        
        while isEarlier(date, end) {

            // Ensure this date's balance is populated.
            if !date.isEqualToDate(self.start) {
                let previousBalance = self.balances[previousDate]
                self.balances[date] = previousBalance
            }
            

            for item in self.budgetItems {
                if item.repeats {
                    if let nextOccurrence = item.getNextOccurrence(previousDate) {
                    
                        if date.isEqualToDate(nextOccurrence) {
                            if let _balance = self.balances[date] {
                                self.balances[date] = _balance + item.amount
                            }
                        }
                    }
                    
                } else {
                    if date.isEqualToDate(item.start) {
                        if let _balance = self.balances[date] {
                            self.balances[date] = _balance + item.amount
                        }
                    }
                }
                
            } // end budget item for
            
            previousDate = date
            date = nextDay(date)

        } // end date while
        
    }
}

func date(dateString:String) -> NSDate {
    return formatter.dateFromString(dateString)!
}

let openDate = date("2015-06-01")
let checking = Account(initialBalance: 1000, start: openDate)

let paycheck = BudgetItem(amount: 650, start: date("2015-06-02"))
paycheck.repeatWeekly()

let item = BudgetItem(amount: -300, start: date("2015-06-04"))

checking.addBudgetItem(paycheck)
checking.addBudgetItem(item)
checking.addBudgetItem(BudgetItem(amount: -400, start: date("2015-06-07")))

checking.recomputeBalances(numDaysLater(openDate, 25))

checking.balances[date("2015-06-01")]
checking.balances[date("2015-06-02")]
checking.balances[date("2015-06-03")]
checking.balances[date("2015-06-04")]
checking.balances[date("2015-06-08")]
checking.balances[date("2015-06-09")]
checking.balances[date("2015-06-10")]



class PlotView : UIView {
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    
    var pts : [CGPoint] = []
    
    override func drawRect(rect: CGRect) {
        if pts.count == 0 {
            return
        }
        
        let context : CGContextRef = UIGraphicsGetCurrentContext()
        
        CGContextSetStrokeColor(context, [0.0, 0.0, 0.0, 1.0])
        CGContextBeginPath(context)
        
        let h = self.frame.height
        CGContextMoveToPoint(context, CGFloat(pts[0].x), CGFloat(h - pts[0].y))

        for i in 1..<pts.count {
            let pt = pts[i]
            CGContextAddLineToPoint(context, pt.x, h - pt.y)
        }
        
        CGContextStrokePath(context)
    }
}

func plot(acct: Account) -> PlotView {
    let viewFrame = CGRect(x:0, y:0, width:1000, height:500)
    let view = PlotView(frame: viewFrame)
    view.backgroundColor = UIColor.lightGrayColor()
    
    let numBalances = acct.balances.count
    var date = acct.start
    var end = numDaysLater(date, numBalances)
    
    var xScale = 1000.0 / Double(numBalances)
    var yScale = 0.1
    
    var pts = [CGPoint]()
    
    var x = 0.0
    var y = acct.balances[date]
    while isEarlier(date, end) {
        let pt = CGPoint(x:x, y:acct.balances[date]! * yScale)
        pts.append(pt)
        
        x += xScale
        date = nextDay(date)
    }

    view.pts = pts
    
    return view
}

let v = plot(checking)
v.setNeedsDisplay()
v




var arr = [1,2,3]
arr.removeAtIndex(1)
arr

var mx = -Double.infinity
for (key, value) in checking.balances {
    mx = max(mx, value)
}
mx

