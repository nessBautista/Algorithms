//: [Previous](@previous)

import Foundation
let heights = [3,0,2,0,4]

func rainWater(_ heights: [Int]) -> Int {
    var max_left = Array(repeating: 0, count: heights.count)
    var max_right = Array(repeating: 0, count: heights.count)
    var water = Array(repeating: 0, count: heights.count)
    var maxSeen: Int = 0
    for (i, n) in heights.enumerated() {
        max_left[i] = maxSeen
        maxSeen = max(maxSeen, n)
    }
    print(max_left)
    maxSeen = 0
    for (i, n) in heights.enumerated().reversed() {
        max_right[i] = maxSeen
        maxSeen = max(maxSeen, n)
    }
    print(max_right)
    
    for i in 0..<heights.count {
        let l = max_left[i]
        let r = max_right[i]
        let waterLevel = min(l, r)
        water[i] = max(0, waterLevel - heights[i])
    }
    return water.reduce(0, +)
}

func rainWaterStack(_ heights: [Int]) -> Int {
    var result = 0
    var stack:[Int] = []
    
    for (i, h) in heights.enumerated() {
        while stack.count >= 2 && h > heights[stack.last!] {
            let r = i
            let bottom = stack.removeLast()
            let l = stack.last!
            let water = min(heights[l], h) - heights[bottom]
            let width = r - l - 1
            print("water at bottom:\(bottom) = \(water)")
            result += water * width
        }
        stack.append(i)
    }
    return result
}


//print(rainWater(heights))
print(rainWaterStack(heights))


//: [Next](@next)
