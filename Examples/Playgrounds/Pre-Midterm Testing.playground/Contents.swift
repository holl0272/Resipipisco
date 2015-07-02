
import Foundation

"1.2" + "3"


",".join(["1","2"])

"\(1.2)"


var number = "1.2"
var userTyped = "3"

number += userTyped
number

let commaStr = ","
let comma = commaStr[commaStr.startIndex]

for digit in number {
    if digit == comma {
        println("hello!")
    }
}

