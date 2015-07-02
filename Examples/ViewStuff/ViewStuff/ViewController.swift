//
//  ViewController.swift
//  ViewStuff
//
//  Created by William Martin on 6/25/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var pincher : UIPinchGestureRecognizer!
    
    @IBOutlet var scalableView : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var square = UIView(frame: CGRectMake(50, 50, 200, 200))
        
        square.contentScaleFactor = 2.0
        
        square.backgroundColor = UIColor.grayColor()
        self.scalableView.addSubview(square)
        
        var redSquare = UIView(frame: CGRectMake(0, 0, 100, 100))
        redSquare.backgroundColor = UIColor.redColor()
        square.addSubview(redSquare)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var scale : CGFloat = 1.0
    
    @IBAction func scaleUp() {
        println(self.pincher.velocity)
        scale += self.pincher.velocity / 100.0
        
        self.scalableView.transform = CGAffineTransformScale(CGAffineTransformIdentity, scale, scale)
    }
    
    
}

