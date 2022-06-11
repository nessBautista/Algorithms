//: [Previous](@previous)

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
	var output:[[Int]] = []
	var path:[Int] = []
	
	func dfs(_ idx: Int){
		if isBaseCase(idx) {
			return
		}
		path.append(candidates[idx])
		dfs(idx)
		path.popLast()
		dfs(idx + 1)
	}
	
	func isBaseCase(_ idx: Int) -> Bool {
		guard idx < candidates.count else { return true }
		let sum = sumArray(path)
		if sum == target {
			output.append(path)
			return true
		} else if sum > target {
			return true
		} else {
			return false
		}
	}
	
	func sumArray(_ array:[Int])->Int {
		return array.reduce(0, +)
	}
	
	dfs(0)
	
	return output
}


print(combinationSum([2,3,6,7], 7))


//: [Next](@next)
