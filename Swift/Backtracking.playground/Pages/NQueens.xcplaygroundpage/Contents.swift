//: [Previous](@previous)

import Foundation

func solveNQueens(_ n: Int) -> [[String]] {
	var output:[[String]] = []
	guard n > 0 else {return output}
	guard n > 1 else {return [["Q"]]}
	
	var chess:[String] = Array(repeating: (0..<n).map({_ in "."}).reduce("", +), count: n)
	var cols = Set<Int>()
	var posD = Set<Int>()
	var negD = Set<Int>()
	var count = 0
	func dfs(_ row:Int){
		if row == n {
			//--if n queens have been placed, add to output
			if count == n {
				output.append(chess)
			}
			
			return
		}
		for col in 0..<n {
			if cols.contains(col)
			   || posD.contains(col + row)
			   || negD.contains(col - row) {
				continue
			}
			count += 1
			chess[row][col] = "Q"
			cols.insert(col)
			posD.insert(col + row)
			negD.insert(col - row)
			dfs(row + 1)
			// -
			count -= 1
			chess[row][col] = "."
			cols.remove(col)
			posD.remove(col + row)
			negD.remove(col - row)
			dfs(row + 1)
		}
	}
	
	dfs(0)
	return output
}
extension String {
	subscript(_ idx: Int) -> Character?{
		get {
			guard idx < self.count else {return nil}
			let index = self.index(self.startIndex, offsetBy: idx)
			return (self[index])
		}
		set {
			guard let value = newValue else {return}
			guard idx < self.count else {return}
			let index = self.index(self.startIndex, offsetBy: idx)
			self.replaceSubrange(index...index, with: [value])
		}
	}
}
let output = solveNQueens(4)
print(output.count)
print(output)
//: [Next](@next)
