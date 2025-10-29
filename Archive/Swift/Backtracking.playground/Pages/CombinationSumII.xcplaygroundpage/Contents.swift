//: [Previous](@previous)

import Foundation

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
	var output: [[Int]] = []
	var path:[Int] = []
	let nums = candidates.sorted(by: {$0 < $1})
	func dfs(_ idx: Int){
		let sum = path.reduce(0,+)
		if sum == target {
			output.append(path)
			return
		} else if sum > target{
			return
		}
		guard idx < nums.count else {
			if sum == target {
				output.append(path)
				return
			}
			return
		}
		path.append(nums[idx])
		dfs(idx + 1)
		path.popLast()
		var i = idx
		while ((i + 1) < nums.count) && (nums[i] == nums[i + 1]){
			i += 1
		}
		dfs(i + 1)
	}
	
	dfs(0)
	return output
}

// This also works
//func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
//	var path:[Int] = []
//	var output:[[Int]] = []
//	let numbers = candidates.sorted(by: {$0 < $1})
//
//	func dfs(_ idx: Int){
//		if isBaseCase() {
//			return
//		}
//		var prev = -1
//		for i in idx..<numbers.count {
//			let n = numbers[i]
//			guard prev != n else {continue}
//			path.append(n)
//			dfs(i + 1)
//			path.popLast()
//			prev = n
//		}
//
//
//	}
//
//	func isBaseCase() -> Bool {
//		let s = sum(path)
//		if s == target {
//			output.append(path)
//			return true
//		} else if s > target {
//			return true
//		}
//		return false
//	}
//	func sum(_ array: [Int])->Int{
//		array.reduce(0, +)
//	}
//
//	dfs(0)
//	return output
//}

let candidates = [2,5,2,1,2]

let target = 5
print(combinationSum2(candidates, target))

//: [Next](@next)
