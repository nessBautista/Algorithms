//: [Previous](@previous)

import Foundation

var letters = "abc"
func getLettersPermutations(_ letters: String)->[String]{
	var output:[String] = []
	var used:[Bool] = Array.init(repeating: false, count: letters.count)
	var path: String = String()
	
	func dfs(){
		if path.count == letters.count {
			output.append(path)
			return
		}
		
		for (idx, letter) in letters.enumerated() {
			if used[idx] {
				continue
			}
			used[idx] = true
			path.append(letter)
			dfs()
			used[idx] = false
			path.popLast()
		}
	}
	
	dfs()
	return output
}

extension String {
	subscript(_ index: Int) -> String {
		let idx = self.index(self.startIndex, offsetBy: index)
		return String(self[idx])
	}
}

let permutations = getLettersPermutations(letters)
print(permutations)


//: [Next](@next)
