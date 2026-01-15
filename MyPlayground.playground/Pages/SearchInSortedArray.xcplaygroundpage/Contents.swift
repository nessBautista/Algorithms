//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"
let intervals = [[1,3],[2,6],[8,10],[15,18]]
let sorted = intervals.sorted(by: {$0[0] < $1[0]})
print(sorted)
//: [Next](@next)
