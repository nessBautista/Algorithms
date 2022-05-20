//: [Previous](@previous)

import Foundation

var greeting = "Hello playground"
let array = greeting.split(separator: " ")
var registry:[Int:Int] = [:]
registry[2] = 2
registry[1] = 1
registry[3] = 3
registry[3]! += 1
for item in registry {
	print(item.key)
}



//: [Next](@next)
