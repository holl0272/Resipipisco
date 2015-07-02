//
//  ViewController.swift
//  Gestures
//
//  Created by William Martin on 6/4/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit



// http://stackoverflow.com/questions/24370061/assign-xib-to-the-uiview-in-swift
extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}
// HackulatorKeyboardView.loadFromNibNamed("HackulatorKeyboardView")
// cast to HackulatorKeyboardView


class Circle {
    var center : CGPoint!
    
    func draw(context:CGContextRef) {
//        let c : CGContextRef = UIGraphicsGetCurrentContext()
        
        let frame = CGRect(x: self.center.x - 10.0, y: self.center.y - 10.0, width: 20.0, height: 20.0)
        
        CGContextSetStrokeColor(context, [1.0, 0.0, 0.0, 1.0])
        
        CGContextBeginPath(context)
        CGContextAddEllipseInRect(context, frame)
        
//        CGContextMoveToPoint(context, 0.0, 0.0)
//        CGContextAddLineToPoint(context, frame.width, frame.height)
        CGContextStrokePath(context)
    }
}


// Set up Squares
// Fill squares randomly
// Switch them after selecting two

class Piece : UIView {
    override func drawRect(rect: CGRect) {
        let context : CGContextRef = UIGraphicsGetCurrentContext()
        
//        let frame = CGRect(x: self.center.x - 10.0, y: self.center.y - 10.0, width: 20.0, height: 20.0)
        
        CGContextSetStrokeColor(context, [1.0, 0.0, 0.0, 1.0])
        
        CGContextBeginPath(context)
        CGContextAddEllipseInRect(context, rect)
//        CGContextStrokePath(context)
        
        CGContextSetFillColor(context, [1.0, 0.0, 0.0, 1.0])
        CGContextFillPath(context)
    }

}


class Board : UIView {
    var circles : [Circle] = [Circle]()
    
    var samplePiece : Piece!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.onInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.onInit()
    }
    
    func onInit() {
        let tapper = UITapGestureRecognizer(target: self, action: "onTap:")
        self.addGestureRecognizer(tapper)
        
        let swiper = UISwipeGestureRecognizer(target: self, action: "onSwipe:")
        self.addGestureRecognizer(swiper)
        
        let pieceFrame = CGRect(x:10.0, y:10.0, width:20.0, height:20.0)
        samplePiece = Piece(frame: pieceFrame)
        samplePiece.backgroundColor = UIColor.clearColor()
        self.addSubview(samplePiece)
    }
    
    func onSwipe(sender:UISwipeGestureRecognizer) {
        println("BOARD SWIPED!")
        

    }
    
    func onTap(sender:UITapGestureRecognizer) {
        println("BOARD TAPPED!")
        
        let tapLocation = sender.locationOfTouch(0, inView: self)
        println(tapLocation)
        
        let circleFrame = CGRect(x:tapLocation.x - 10.0, y:tapLocation.y - 10, width:20.0, height:20.0)
        let circle = Circle()
        circle.center = tapLocation
        
        self.circles.append(circle)
        
        self.setNeedsDisplay()
        
//        circle.backgroundColor = UIColor.clearColor()
//        circle.center = tapLocation
//        circle.frame.size = CGSize(width: 20.0, height: 20.0)
//        self.addSubview(circle)
//        self.setNeedsDisplayInRect(circleFrame)
        
    }
    
    override func drawRect(rect: CGRect) {
        let c : CGContextRef = UIGraphicsGetCurrentContext()
        
        for circle in self.circles {
            circle.draw(c)
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var tapper: UITapGestureRecognizer!
    
    @IBAction func onTap(sender:UITapGestureRecognizer) {
        println("TAP!")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let boardFrame = CGRect(x: 0.0, y: 20.0, width: self.view.frame.width, height: self.view.frame.width)
        let board = Board(frame: boardFrame)
        board.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(board)
        self.view.setNeedsLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

