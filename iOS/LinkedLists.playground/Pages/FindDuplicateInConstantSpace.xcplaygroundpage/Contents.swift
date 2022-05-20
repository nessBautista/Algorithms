//: [Previous](@previous)

import Foundation

func findDuplicate(_ nums: [Int]) -> Int {
	var slow = nums[0]
	var fast = nums[nums[0]]
	repeat {
		slow = nums[slow]
		fast = nums[nums[fast]]
	} while slow != fast
	
	var slow2 = 0
	repeat {
		slow = nums[slow]
		slow2 = nums[slow2]
		
	} while slow2 != slow	
	return slow
}

findDuplicate([1,3,4,2,2])

//: [Next](@next)
