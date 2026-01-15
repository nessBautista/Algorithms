//: [Previous](@previous)

import Foundation
let temperatures = [73,74,75,71,69,72,76,73]
//let temperatures = [30,40,50,60]

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var result:[Int] = Array(repeating:0, count: temperatures.count)
    var stack:[Int] = []
    
    for (i, t) in temperatures.enumerated() {
        while !stack.isEmpty && t > temperatures[stack.last!] {
            let top = stack.removeLast()
            result[top] = i - top
        }
        stack.append(i)
    }
    

    return result
}

dailyTemperatures(temperatures)


//: [Next](@next)
