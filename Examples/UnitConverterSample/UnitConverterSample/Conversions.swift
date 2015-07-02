//
//  Conversions.swift
//  UnitConverterSample
//
//  Created by William Martin on 5/21/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import Foundation


class Conversion {
    var imperialUnits : String = ""
    var metricUnits : String = ""
    
    init() {
        
    }
    
    func convert(imperial:Double) -> Double {
        return 0.0
    }
    
    func inverse(metric:Double) -> Double {
        return 0.0
    }
    
}


class FahrenheitToCelsius : Conversion {
    
    override init() {
        super.init()
        self.imperialUnits = "F"
        self.metricUnits = "C"
    }

    override func convert(imperial:Double) -> Double {
        return (imperial - 32.0) * 5.0 / 9.0
    }
    
    override func inverse(metric:Double) -> Double {
        return metric * 9.0 / 5.0 + 32.0
    }
}
