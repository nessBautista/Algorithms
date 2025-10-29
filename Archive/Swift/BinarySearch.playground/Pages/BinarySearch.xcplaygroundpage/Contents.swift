//: [Previous](@previous)

import Foundation


// what is divided is not the array, but the indexes you are searching for
func binarySearch(_ target:Int, _ array: [Int], low:Int, high:Int)-> Int? {
	// base case
	if low > high {
		return nil
	}
	let mid = Int(Double((low + high) / 2).rounded(.down))
	let guess = array[mid]
	//print(guess)
	if guess == target {
		return mid
	} else  if target < guess  {
		return binarySearch(target, array, low: low, high: mid - 1)
	} else {
		return binarySearch(target, array, low: mid + 1, high: high)
	}
}
let numbers = [2,4,8,20,50,51,70]
if let targetIdx = binarySearch(51, numbers, low:0, high:numbers.count - 1) {
	print(targetIdx)
}

//: [Next](@next)
