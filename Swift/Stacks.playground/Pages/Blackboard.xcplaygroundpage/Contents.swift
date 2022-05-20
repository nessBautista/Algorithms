//: [Previous](@previous)

import Foundation
func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
	var output = Array(repeating: -1, count: nums1.count)
	var register: [Int:(idx:Int, max:Int)] = [:]
	var stack:[(idx:Int, value:Int)] = []
	
	for (idx, n) in nums2.enumerated() {
		if stack.isEmpty {
			stack.append((idx, n))
			continue
		}

		while !stack.isEmpty{
			
			if let last = stack.last {
				if n > last.value {
					register[last.value] = (last.idx, n)
					stack.popLast()
				} else {
					break
					
				}
				
			}
		}
		stack.append((idx,n))
	}
	
	for (idx, n) in nums1.enumerated() {
		if let max = register[n]?.max {
			output[idx] = max
		}
	}
	
	
	return output
}
let nums1 = [2,4]//[4,1,2]
let nums2 = [1,2,3,4]//[1,3,4,2]
let output = nextGreaterElement(nums1, nums2)
print(output)
//: [Next](@next)


