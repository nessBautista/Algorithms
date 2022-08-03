//: [Previous](@previous)

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
	var output: Int?
	var boundary:Int?
	func binSearch(_ nums:[Int], b: Bool, low: Int, high: Int){
		guard output == nil else {return}
		if b {
			guard boundary == nil else {return}
		}
		
		if low > high {
			return
		}
		
		let mid = (low + high) / 2
		if nums[mid] == target {
			output = mid
			return
		}
		
		if b {
			if isBoundary(mid) {
				boundary = mid
				return
			}
			binSearch(nums, b: true, low: mid + 1, high: high)
			binSearch(nums, b: true, low: low, high: mid - 1)
		} else {
			if nums[mid] < target {
				binSearch(nums, b: false, low: mid + 1, high: high)
			} else {
				binSearch(nums, b: false, low: low, high: mid - 1)
			}
		}
	}
	// find boundary
	binSearch(nums, b: true, low: 0, high: nums.count - 1)
	
	if let boundary = boundary {
		print(boundary)
		if nums[0] <= target && target <= nums[boundary - 1] {
			print("-")
			binSearch(nums, b: false, low: 0, high: boundary)
		} else {
			binSearch(nums, b: false, low: boundary + 1, high: nums.count - 1)
		}
	}
	
	func isBoundary(_ idx: Int)->Bool{
		guard idx > 0 else {return false}
		return nums[idx] < nums[idx - 1]
	}
	
	return output ?? -1
}
search([3,5,1],3)
//: [Next](@next)
