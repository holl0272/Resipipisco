//
//  Board.swift
//  BejeweledClone
//
//  Created by Eric Holland on 6/4/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
//

import UIKit

class Board : UIView {
    override init(frame: CGRect) {
        super.init(frame:frame)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }

    override func drawRect(rect: CGRect) {
        let context : CGContextRef = UIGraphicsGetCurrentContext()
        
        CGContextBeginPath(context)
        let circleRect = CGRect(x: 50.0, y:50.0, width: 20.0, height: 20.0)
        CGContextAddEllipseInRect(context, circleRect)
        CGContextSetFillColor(context, [1.0, 0.0, 0.0, 1.0])
        CGContextFillPath(context)
        
    }
}
