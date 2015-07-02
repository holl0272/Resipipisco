import Foundation

func isPrime(n:Int) -> Bool {
    if n == 2 {
        return true
    } else if n % 2 == 0 {
        return false
    }
    
    var i = 3
    while i * i <= n {
        if n % i == 0 {
            return false
        }
        i += 2
    }
    
    return true
}

isPrime(2)
isPrime(3)
isPrime(4)
isPrime(1009)
