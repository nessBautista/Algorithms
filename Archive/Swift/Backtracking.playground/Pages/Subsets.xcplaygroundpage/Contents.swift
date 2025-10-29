//: [Previous](@previous)

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
	var output:[[Int]] = []
	var subset = [Int]()
	
	func dfs(_ idx: Int){
		if idx >= nums.count {
			output.append(subset)
			return
		}
		
		//add number
		subset.append(nums[idx])
		dfs(idx + 1)
		
		//don't add number
		subset.popLast()
		dfs(idx + 1)
	}
	
	dfs(0)
	return output
}
print(subsets([1,2,3]))



//: [Next](@next)
