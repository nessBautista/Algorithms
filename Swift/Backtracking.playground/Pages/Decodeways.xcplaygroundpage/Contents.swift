//: [Previous](@previous)

import Foundation

let startingValue = Int(("A" as UnicodeScalar).value) // 65




func decodeWays(_ s:String) -> Int{
	var count = 0
	let numbers = (1...26).map{"\($0)"}
	
	func dfs(_ idx: Int) {
		// base case
		if idx == s.count { //we have reached the end
			count += 1
		}
		let remaining = s[idx]
		for number in numbers {
			if remaining.starts(with: number) {
				dfs(idx + number.count)
			}
		}
	}
	dfs(0)
	return count
}
print(decodeWays("12"))

extension String {
	subscript(_ idx:Int) -> String {
		guard idx < self.count else {return String()}
		
		let index = self.index(self.startIndex, offsetBy: idx)
		return String(self.substring(from: index))
	}
}
//: [Next](@next)
