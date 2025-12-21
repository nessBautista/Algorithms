//: [Previous](@previous)

import Foundation

func mergeSort(_ array: [Int]) -> [Int] {
    // Base case
    guard array.count > 1 else {return array}
    // Split the array in 2 halves
    let middle = array.count / 2
    let leftHalf = Array(array[0..<middle])
    let rightHalf = Array(array[middle..<array.count])
    //Conquer: Recursively sort each half
    let sortedLeft = mergeSort(leftHalf)
    let sortedRight = mergeSort(rightHalf)
    
    // Merge the sorted halfs
    return merge(sortedLeft, sortedRight)
}

func merge(_ left:[Int], _ right: [Int]) -> [Int] {
    var result:[Int] = []
    var leftIdx: Int = 0
    var rightIdx: Int = 0
    
    while leftIdx < left.count && rightIdx < right.count {
        if left[leftIdx] <= right[rightIdx] {
            result.append(left[leftIdx])
            leftIdx += 1
        } else {
            result.append(right[rightIdx])
            rightIdx += 1
        }
    }
    
    result.append(contentsOf:left[leftIdx...])
    result.append(contentsOf:right[rightIdx...])
    
    return result
}

let sorted = mergeSort([38, 27, 43, 3, 9, 82, 10])
print(sorted)

//: [Next](@next)
