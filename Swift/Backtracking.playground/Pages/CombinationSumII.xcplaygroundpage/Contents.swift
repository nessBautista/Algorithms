//: [Previous](@previous)

import Foundation

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
	var path:[Int] = []
	var output:[[Int]] = []
	
	func dfs(_ idx: Int){
		if isBaseCase(idx) {
			return
		}
		for i in idx..<candidates.count {
			path.append(candidates[i])
			dfs(i + 1)
			path.popLast()
		}
		
	}
	func isBaseCase(_ idx: Int)-> Bool {
		guard idx < candidates.count else {return true}
		
		if sum(path) == target {
			output.append(path)
			return true
		} else if sum(path) > target {
			return true
		}
		return false
	}
	func sum(_ array:[Int])->Int {
		array.reduce(0, +)
	}
	dfs(0)
	return output
}

let candidates = [10,1,2,7,6,1,5]
let target = 8
print(combinationSum2(candidates, target))

//: [Next](@next)
