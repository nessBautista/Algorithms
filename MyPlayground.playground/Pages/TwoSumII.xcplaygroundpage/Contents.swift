//: [Previous](@previous)

import Foundation

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    // numbers is already sorted (1-indexed in LeetCode)
    var left = 0
    var right = numbers.count - 1
    
    // Your implementation here
    while left < right {
        if numbers[left] + numbers[right] == target {
            return [left, right]
        } else if numbers[left] + numbers[right] < target {
            left += 1
        } else {
            right -= 1
        }
    }
    return []
}


print(twoSum([1, 2, 3, 4, 5, 6], 9))  // Should return [2, 5] (indices of 3 and 6)
print(twoSum([2, 7, 11, 15], 9))      // Should return [0, 1] (indices of 2 and 7)
print(twoSum([1, 3, 4, 5, 7, 11], 9)) // Should return [2, 4] (indices of 4 and 5)

//: [Next](@next)
