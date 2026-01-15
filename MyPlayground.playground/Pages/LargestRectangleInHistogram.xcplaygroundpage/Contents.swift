//: [Previous](@previous)

import Foundation
// [2,4,2]
let bars = [0,3,4,5,2,1]

func largestRectangleArea(_ heights: [Int]) -> Int {
    var maxArea = 0
    var stack: [Int] = []

    for i in 0..<heights.count {
        // While current height < stack top height
        while stack.count > 0 && heights[i] < heights[stack.last!] {
            //     Pop and calculate area
            let current = i
            let heigh_idx = stack.removeLast()
            let height = heights[heigh_idx]
            let left = stack.last ?? -1
            let width = current - left - 1 
            let area = height * width
            //     Update maxArea
            maxArea = max(maxArea, area)
        }
        // Push current index
        stack.append(i)
    }

    // Process remaining stack
    // For each remaining index, calculate area with i = heights.count
    while !stack.isEmpty {
        let current = heights.count
        let height = heights[stack.removeLast()]
        let left = stack.last ?? -1
        let width = current - left - 1
        let area = height * width
        //     Update maxArea
        maxArea = max(maxArea, area)
    }

    return maxArea
}

print(largestRectangleArea(bars))


//: [Next](@next)
