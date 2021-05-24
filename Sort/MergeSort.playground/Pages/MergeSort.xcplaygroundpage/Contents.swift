//: [Previous](@previous)

import Foundation

func mergeSort(_ input: [Int])-> [Int] {
    // base case
    guard input.count > 1 else {
        return input
    }
    // Get the middle
    let middle = input.count / 2
    //Continue dividing until the base case (input.count == 1)
    let left = mergeSort(Array(input[0..<middle]))
    let right = mergeSort(Array(input[middle..<input.count]))
    
    //At this point you have 2 arrays of different sizes, you need to merge them
    return merge(left, right)
    
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var l = 0
    var r = 0
    var result:[Int] = []
    
    // Loop trought arrays. Select the minor value in each iteration
    while l < left.count && r < right.count {
        if left[l] > right[r] {
            result.append(right[r])
            r += 1
        } else if left[l] < right[r] {
            result.append(left[l])
            l += 1
        } else {
            result.append(left[l])
            result.append(right[r])
            l += 1
            r += 1
        }
    }
    
    // Adjust. Complete the result with the remaining elements in whichever array is left
    while l < left.count {
        result.append(left[l])
        l += 1
    }
    while r < right.count {
        result.append(right[r])
        r += 1
    }
    return result
}
//Testing
var numbers: [Int] = (0..<10).map({ _ in  .random(in: 1...20) })

print(numbers)
print(mergeSort(numbers))
//: [Next](@next)
