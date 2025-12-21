//: [Previous](@previous)

import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prod = 1
        var past:[Int] = [1]
        var future:[Int] = [1]

        for i in (0..<nums.count - 1) {
            prod *= nums[i]
            past.append(prod)
        }
    
        prod = 1
        for i in stride(from: nums.count - 1, through: 1, by: -1) {
            prod *= nums[i]
            future.insert(prod, at: 0)
        }
        var result:[Int] = []
        for i in (0..<future.count){
            result.append(past[i] * future[i])
        }
        return result
}

let nums = [1,2,3,4]
productExceptSelf(nums)
//: [Next](@next)
