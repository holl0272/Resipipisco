//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by William Martin on 6/30/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setUpScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpScrollView() {
        for x in 0..<10 {
            for y in 0..<20 {
                
                let frame = CGRectMake(
                    CGFloat(x) * 50.0,
                    CGFloat(y) * 50.0,
                    40.0,
                    40.0)
//                let square = UIView(frame:frame)
                
                let square = UIButton(frame: frame)
                square.backgroundColor = UIColor.redColor()
                square.addTarget(self, action: "hello:", forControlEvents: .TouchUpInside)
                
                self.scrollView.addSubview(square)
            }
        }
        
        let squareSize = 40.0
        let scrollHeight = 20 * 50.0 + squareSize
        
        self.scrollView.contentSize = CGSize(
            width: self.view.frame.width,
            height: CGFloat(scrollHeight)
        )
    }
    
    func hello(sender:AnyObject?) {
        println("Hello!")
    }
}












