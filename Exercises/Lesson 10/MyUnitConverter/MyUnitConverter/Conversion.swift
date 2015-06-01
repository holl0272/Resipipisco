//
//  Conversion.swift
//  MyUnitConverter
//
//  Created by Eric Holland on 5/31/15.
//  Copyright (c) 2015 Eric Holland. All rights reserved.
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
    
}

class FahrenheitToCelsius : Conversion {
    
    override init() {
        super.init()
        self.imperialUnits = "F"
        self.metricUnits = "C"
    }
    
    override func convert(imperial:Double) -> Double {
        let F = imperial
        let C = 5.0 * (F - 32.0) / 9.0
        return C
    }
}

class MilesToKilometers : Conversion {
    
    override init() {
        super.init()
        self.imperialUnits = "mi"
        self.metricUnits = "km"
    }
    
    override func convert(imperial:Double) -> Double {
        let Mi = imperial
        let Km = Mi / 0.62137
        return Km
    }
}

class PoundsToKilograms : Conversion {
    
    override init() {
        super.init()
        self.imperialUnits = "lbs"
        self.metricUnits = "kg"
    }
    
    override func convert(imperial:Double) -> Double {
        let Lbs = imperial
        let Kg = Lbs / 2.2046
        return Kg
    }
}

class InchesToCentimeters : Conversion {
    
    override init() {
        super.init()
        self.imperialUnits = "in"
        self.metricUnits = "cm"
    }
    
    override func convert(imperial:Double) -> Double {
        let In = imperial
        let Cm = In / 0.39370
        return Cm
    }
}