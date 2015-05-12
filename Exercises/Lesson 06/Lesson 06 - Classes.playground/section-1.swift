import Foundation

//Class definition
class Dog {
    var name:String
    var age:Int
    
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
    
    func bark() -> String {
        return "\(self.name) is \(self.age) and says, woof!"
    }
}


//Instantiation
var myDog = Dog(name:"Tycoon",age:7)


//Calling a method
myDog.bark()
myDog.name
myDog.age

//myDog.name = "Bear"
//myDog.name
//myDog.age
//myDog.bark()


//Creating a second instance
//var mySistersDog = Dog(name:"Sugar",age:3)
//mySistersDog.name
//mySistersDog.age
//mySistersDog.bark()

func prettyPrint(dog:Dog) -> String {
    return "\(dog.name) is \(dog.age) years old!"
}

prettyPrint(myDog)

//Using Classes in other Classes
class Point {
    var x:Double
    var y:Double

    init(x:Double,y:Double) {
        self.x = x
        self.y = y
    }
}

let origin = Point(x:0.0,y:0.0)
origin.x
origin.y

class Line {
    var startPoint:Point
    var endPoint:Point
    
    init(startPoint:Point,endPoint:Point) {
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
}

var xAxis = Line(startPoint:origin,endPoint:Point(x:10000000.0,y:0.0))


//Class with Optionals
class optionalPoint {
    var x:Double?
    var y:Double?
}

let somePOint = optionalPoint()
origin.x
origin.y

//Extending a Class
//Shiba is a "subclass" of Dog
//Dog is a "superclass" of Shiba
class Shiba:Dog {
    var temperament:String = "stubborn"
    
    //An example of "overriding" a function and in effect,
    //ensuring that Shiba have a different behavios from Dogs.
    override func bark() -> String {
        return "\(self.name) yelps!"
    }
}

class RedShiba:Shiba {
    override func bark() -> String {
        return "\(self.name) doesn't bark!"
    }
}

var otherDog = RedShiba(name:"Baby Bear",age:1)
otherDog.bark()

var willsDog = Shiba(name:"Toshi",age:4)
willsDog.temperament

//Example of inheritance
willsDog.name
willsDog.bark()

//Example of polymorphism
prettyPrint(willsDog)

//Create another instance of "Shiba" and name her "Kuma"
var someoneElsesDog = Shiba(name:"Kuma",age:9)

someoneElsesDog.name
someoneElsesDog.age
someoneElsesDog.temperament
someoneElsesDog.bark()

class Person {
    var name:String
    var age:Int?
    
    init(name:String) {
        self.name = name
    }
}

var myFriend = Person(name:"Topher")


//Inclass Exercise
class Player {
    var name:String
    var health:Int
    
    init(name:String,health:Int){
        self.name = name
        self.health = health
    }
    
    func isAlive(health:Int) -> Bool {
        if(health > 0) {
            return true
        }
        else {
            return false
        }
    }
    
    func attack(mode:Int) -> Int {
        var damage = 0 * mode
        return damage
    }
}

class GoodPlayer:Player {
    override func attack(mode:Int) -> Int {
        var damage = 2 * mode
        return damage
    }
}

class BadPlayer:Player {
    override func attack(mode:Int) -> Int {
        var damage = 1 * mode
        return damage
    }
}

class Match {
    var player1:Player
    var player2:Player
    
    init(player1:Player,player2:Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    func playGame(player1:Player,player2:Player) -> String {
        
        var rounds:Int = 1
        var winnersName:String
        var damageSuffered:Int
        
        while (player1.isAlive(player1.health) == true && (player2.isAlive(player2.health) == true)) {
            
            var modeOfAttackForPlayer1 = Int(arc4random_uniform(5)+1)
            var damageInflictedByPlayer1 = player1.attack(modeOfAttackForPlayer1)
            
            var modeOfAttackForPlayer2 = Int(arc4random_uniform(5)+1)
            var damageInflictedByPlayer2 = player2.attack(modeOfAttackForPlayer2)
            
            player1.health = player1.health - damageInflictedByPlayer2
            player2.health = player2.health - damageInflictedByPlayer1
            
            rounds++
        }
        
        if(player1.isAlive(player1.health)) {
            winnersName = player1.name
            damageSuffered = 100 - player1.health
        }
        else {
            winnersName = player2.name
            damageSuffered = 100 - player2.health
        }
        
        return "\(player1.name) vs. \(player2.name) >>> \(winnersName) suffered \(damageSuffered) hits, but still won after \(rounds) rounds"
    }

}

let player1 = GoodPlayer(name:"Luke",health:100)
let player2 = BadPlayer(name:"Darth",health:100)

var match1 = Match(player1:player1,player2:player2)
match1.playGame(player1,player2:player2)

player1.health = 100
player2.health = 100

var match2 = Match(player1:player1,player2:player2)
match2.playGame(player1,player2:player2)

player1.health = 100
player2.health = 100

var match3 = Match(player1:player1,player2:player2)
match2.playGame(player1,player2:player2)

player1.health = 100
player2.health = 100

var match4 = Match(player1:player1,player2:player2)
match4.playGame(player1,player2:player2)

player1.health = 100
player2.health = 100

var match5 = Match(player1:player1,player2:player2)
match5.playGame(player1,player2:player2)

