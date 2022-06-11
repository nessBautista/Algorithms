//
//  PhoneCombinations.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 08/06/22.
//

import Foundation
class PhonePermutations {
	
	let KEYBOARD = [
		"2" : "abc",
		"3" : "def",
		"4" : "ghi",
		"5" : "jkl",
		"6" : "mno",
		"7" : "pqrs",
		"8" : "tuv",
		"9" : "wxyz"
	]
	
	func getPermutations(_ numbers: String) -> [String]{
		var output:[String] = []
		var path = String()
		
		func dfs(_ path: inout String){
			// base case
			if path.count == numbers.count {
				output.append(path)
				return
			}
			let letters = KEYBOARD[numbers[path.count]] ?? String()
			for letter in letters {
				path.append(letter)
				dfs(&path)
				path.removeLast()
			}
		}
		dfs(&path)
		
		return output
	}
}

extension String {
	subscript(_ idx: Int) -> String {
		guard idx < self.count else {return String()}
		let index = self.index(self.startIndex, offsetBy: idx)
		return String(self[index])
	}
}
