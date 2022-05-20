//: [Previous](@previous)

import Foundation


func findMin(_ nums: [Int]) -> Int {
	var minIdx:Int? = nil
	binarySearch(low:0, high: nums.count - 1)
	
	func binarySearch(low:Int, high: Int) {
		guard minIdx == nil else {return}
		guard low <= high else {return}
		let mid = (low + high) / 2
		
		// check right
		if (mid+1) < (nums.count) {
			if nums[mid + 1] < nums[mid] {
				minIdx = mid + 1
			}
		}
		// check left
		if mid-1 >= 0 {
			if nums[mid-1] > nums[mid] {
				print("check left \(mid)")
				minIdx = mid
			}
		}
		
		binarySearch(low: low, high: mid - 1)
		binarySearch(low: mid + 1, high: high)
		
	}
	return nums[minIdx ?? 0]
}
var nums = [7,9,0,1,2,4,6]
findMin(nums)
//: [Next](@next)
