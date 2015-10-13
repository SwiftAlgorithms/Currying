import Foundation

func add(a: Int, _ b: Int) -> Int {
    return a + b
}

let onePlusTwo = add(1, 2)

let someNumbers = [1, 2, 3, 5, 8, 13, 21]

func plusTwo(a: Int) -> Int {
    return a + 2
}

let someNumbersPlusTwo = someNumbers.map(plusTwo)

func addCurried(a: Int) -> (Int -> Int) {
    return { b in a + b}
}

let plusFive = addCurried(5)

let twoPlusFive = plusFive(2)

let threePlusSeven = addCurried(3)(7)

let plusThree = addCurried(3)

let someNumbersPlusThree = someNumbers.map(plusThree)


// Buit-in Currying

func plus(a: Int)(_ b: Int) -> Int {
    return a + b
}

let plusNine = plus(9)

let eightPlusOne = plus(8)(1)

class MysteriousFramework {
    class func blackMagicMethod(spell: String, energy: Int ) -> String {
        // [Black magic going on...]
        return "\"\(spell)\" spell invoked with energy \(energy)"
    }
}

func blackMagicMethod(spell: String)(_ energy: Int) -> String {
    return MysteriousFramework.blackMagicMethod(spell, energy: energy)
}

let convertPHPCodeToSwift = blackMagicMethod("Convert PHP code to Swift")

let attemptOne = convertPHPCodeToSwift(3)

let attemptTwo = convertPHPCodeToSwift(10000)

let attemptThree = convertPHPCodeToSwift(Int.max)


// Generic Currying

func curry<A, B, C>(f: (A, B) -> C) -> (A -> (B -> C)) {
    return { a in { b in return f(a, b) } }
}

func askBetween(this: String, that: String ) -> String {
    return "\(this) or \(that)?"
}

let askBetweenSwift = curry(askBetween)("Swift")

let otherLanguages = ["Objective-C", "Haskell", "Scala", "Whitespace"]
let questions = otherLanguages.map(askBetweenSwift)


// Extra: Currying is everywhere

struct Robot {
    let name: String
    
    func greet(someone: String) -> String {
        return "Hello \(someone), I'm \(name)!"
    }
}

let john = Robot(name:"John")
john.greet("World")

let greeter = Robot.greet

greeter(john)("Middle Earth")

let jane = Robot(name: "Jane")
greeter(jane)("Westeros")
