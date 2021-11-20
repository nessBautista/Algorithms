//: [Previous](@previous)

import Foundation

func binarySearch(_ target: Int, _ array: [Int]) -> Int? {
  let pivot = (a.count - 1) / 2
  let result = searchHelper(target, array, 0, a.count - 1, pivot)
  return result
}

func searchHelper(_ target: Int, _ array: [Int], _ l: Int, _ r: Int, _ pivot: Int) -> Int? {
  guard r >= 0 && l <= (array.count-1) else {return nil}
  
  if array[pivot] == target {
    return pivot
  }
  
  if target < array[pivot] {
    return searchHelper(target, array, l, pivot - 1, (l + pivot-1)/2)
  } else {
    return searchHelper(target, array, pivot + 1, r, (pivot + 1 + r)/2)
  }
}


let a = [1,3,5,6,7,8,11,14,35]
print(binarySearch(7, a))

//: [Next](@next)
