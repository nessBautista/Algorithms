//: [Previous](@previous)

import Foundation

func combinationSum(_ candidates: [Int],
					_ target: Int) -> [[Int]] {
	var output:[[Int]] = []
	var path:[Int] = []
	
	func dfs(_ idx: Int){
		let sum = path.reduce(0, +)
		guard idx < candidates.count else {
			if sum == target {
				output.append(path)
			}
			return
		}
		if sum == target {
			output.append(path)
			return
		}
		
		if sum > target {
			return
		}
		
		path.append(candidates[idx])
		dfs(idx)
		path.popLast()
		dfs(idx+1)
	}
	
	dfs(0)
	return output
}

print(combinationSum([2,3,6,7], 7))


//: [Next](@next)
