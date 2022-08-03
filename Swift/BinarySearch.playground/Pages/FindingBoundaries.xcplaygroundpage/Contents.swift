//: [Previous](@previous)

import Foundation

let array = [false, false, true, true, true] // boundary at idx = 2
func findBoundary(_ array: [Bool]) -> Int {
	var output:Int = -1
	
	func binarySearch(_ array: [Bool], low: Int, high: Int) {
		if low > high {
			return
		}
		let mid = (low + high) / 2
		
		// When finding some true we can save the index and discard to the right
		//including mid
		if array[mid] {
			output = mid
			binarySearch(array, low: low, high: mid - 1)
		} else {
			// when false, discard everything left (including mid)
			binarySearch(array, low: mid + 1, high: high)
		}
	}
	binarySearch(array, low:0, high: array.count - 1)
	return output
}
findBoundary(array)

let array2 = [false, false, false,false, false, true, true, true] // 5
findBoundary(array2)
//: [Next](@next)
