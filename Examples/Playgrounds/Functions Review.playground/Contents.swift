import Foundation


func sayHello(name:String) -> String {
    func formatName() -> String{
        return "\(name)..."
    }
    
    func formatMessage(greeting:String) -> String {
        return "\(greeting)!!!!!"
    }
    
    let msg = formatMessage("Hello")
    let formattedName = formatName()
    
    return "\(msg) \(formattedName)!"
}

sayHello("Toshi")




// for - loop

func loopMe() {
    for x in 1...10 {
        x
    }
}



let meters = 3.0
let feetPerMeter = 3.28
let feet = feetPerMeter * meters
feet


func convertMetersToFeet(meters:Double) -> Double {
    let feetPerMeter = 3.28
    let feet = feetPerMeter * meters
    return feet
}
convertMetersToFeet(3.0)
convertMetersToFeet(5.0)










