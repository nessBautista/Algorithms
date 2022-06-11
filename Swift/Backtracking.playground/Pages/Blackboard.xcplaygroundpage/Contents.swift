//: [Previous](@previous)

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
	var output:[[Int]] = []
	var path:[Int] = []
	
	func dfs(_ idx: Int){
		if idx == nums.count {
			output.append(path)
			return
		}
		
		let n = nums[idx]
		path.append(n)
		dfs(idx + 1)
		path.popLast()
		dfs(idx + 1)
	}
	dfs(0)
	return output
}

subsets([1,2,3])
//: [Next](@next)
