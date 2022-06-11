//: [Previous](@previous)

import Foundation

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

func letterCombinationsOfPhoneNumber(_ numbers: String)->[String]{
	var output:[String] = []
	
	func dfs(_ combination: inout String){
		if combination.count == numbers.count {
			output.append(combination)
			return
		}
		guard let letters = KEYBOARD[numbers[combination.count]] else {return}
		for letter in letters {
			combination.append(String(letter))
			dfs(&combination)
			combination.popLast()
		}
		
	}
	var combination:String = String()
	dfs(&combination)
	return output
}

extension String {
	subscript(_ idx: Int)-> String{
		guard idx < self.count else {return String()}
		
		let index = self.index(self.startIndex, offsetBy: idx)
		return String(self[index])
	}
}

letterCombinationsOfPhoneNumber("23")

//: [Next](@next)
