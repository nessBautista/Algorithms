//: [Previous](@previous)

import Foundation

var nums = [1,2,3,4,5,6,7,8,9,10]

func binarySearch(_ nums:[Int], _ target: Int)-> Int {
    var left = 0
    var right = nums.count - 1
    
    
    while left <= right {
        let mid = left + (right - left)/2
        
        if nums[mid] == target {
            return mid
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
        
    }
    return -1
}

let test: [([Int], Int)] = [
    ([1, 3, 5, 7, 9], 5),  // Returns 2 ✓
    ([1, 3, 5, 7, 9], 1),  // Returns 0 ✓
    ([1, 3, 5, 7, 9], 9),  // Returns 4 ✓
    ([1, 3, 5, 7, 9], 4),  // Returns -1 ✓
    ([], 5)  // Returns -1 ✓
]

for item in test {
    print(
        binarySearch(item.0, item.1)
    )
}


//: [Next](@next)
