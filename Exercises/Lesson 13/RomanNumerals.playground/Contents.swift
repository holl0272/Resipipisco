//: Playground - noun: a place where people can play

import UIKit

let I = 1
let V = 5
let X = 10
let L = 50
let C = 100
let D = 500
let M = 1000

var testSet = ["MMMMDCLXXII","MMDCCCLXXXIII","MMMDLXVIIII","MMMMDXCV","DCCCLXXII","MMCCCVI","MMMCDLXXXVII","MMMMCCXXI","MMMCCXX","MMMMDCCCLXXIII"]

var decimalSet = [Int]()

func romanToDecimal(org:String) -> Int {
    
    let characters = Array(org)
    
    var temp:Int = 0

    for var i = 0; i < characters.count; i++ {
    
        var char = characters[i]
    
        switch (char){
        case "I":
            temp += 1
        case "V":
            temp += 5
        case "X":
            temp += 10
        case "L":
            temp += 50
        case "C":
            temp += 100
        case "D":
            temp += 500
        case "M":
            temp += 1000
        default:
            temp += 0
        }
    }
    return temp
}


for var i = 0; i < testSet.count; i++ {

    var decimal = romanToDecimal(testSet[i])
    
    decimalSet.append(decimal)
    
}

decimalSet

var optimal:String = ""

func checkThousands(decimal:Int) -> Int {
    
    var thousands = decimalSet[0] / M
    var hundred = 0
    
    if(thousands > 0) {
        var mod = thousands%2
        if(mod == 0){
            for var i = 1; i <= thousands; i++ {
                optimal += "M"
            }
        }
        hundred = decimalSet[0] - (thousands * 1000)
    }
    
    return hundred
}



var fiveHundred = decimalSet[0] / D

if(fiveHundred > 0) {
    var mod = fiveHundred%2
    if(mod == 0){
        for var i = 1; i <= fiveHundred; i++ {
            optimal += "C"
        }
    }
}

var oneHundred = decimalSet[0] / C
var fifty = decimalSet[0] / L
var ten = decimalSet[0] / X
var five = decimalSet[0] / V
var one = decimalSet[0] / I





if(oneHundred > 0) {
    var mod = oneHundred%2
    if(mod == 0){
        for var i = 1; i <= oneHundred; i++ {
            optimal += "C"
        }
    }
}

println(optimal)


oneHundred%2
fifty%2
ten%2
five%2
one%2


//------------------------


var orgString : String = "MMMDLXVIIII"

var opt : String = "MMMDLXIX"

println(orgString)
if orgString.rangeOfString("VIIII") != nil{
    orgString.stringByReplacingOccurrencesOfString("VIIII", withString:"IX")
}





