//: [Previous](@previous)

import Foundation

let s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
let words = ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]

func wordBreak(_ s:String, words:[String])-> Bool {
	var memo:[Int: Bool] = [:]
	func dfs(_ idx:Int) -> Bool {
		// base case
		if memo[idx] != nil {
			return memo[idx]!
		}
		if idx == s.count {
			return true
		}
		for w in words {
			if s[idx].starts(with: w) {
				if dfs(idx + w.count) {
					memo[idx + w.count] = true
					return true
				} else {
					memo[idx + w.count] = false
				}
			}
		}
		return false
	}
	return dfs(0)
}

let result = wordBreak(s, words: words)
print(result)
extension String {
	subscript(_ idx: Int) -> String {
		guard idx < self.count else {return String()}
		let index = self.index(self.startIndex, offsetBy: idx)
		return String(self[index..<self.endIndex])
	}
}
//: [Next](@next)
