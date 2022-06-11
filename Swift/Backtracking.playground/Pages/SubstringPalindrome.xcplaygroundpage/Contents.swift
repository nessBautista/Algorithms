//: [Previous](@previous)

import Foundation

var greeting = "Hello"
let inverse = greeting.reversed().reduce("") { result, char in
	return (result + String(char))
}



func partition(_ s: String) -> [[String]] {
	var output = [[String]]()
	var path:[String] = []
	
	func dfs(_ idx: Int, _ sub: String) {
		print(path, idx)
		
		if sub.isEmpty {
			print("--")
			output.append(path)
			return
		}
			
		for i in 0..<sub.count {
			let subsets = sub[i]
			path.append(subsets.0)
			if subsets.0.isPalindrome() {
				dfs(i, subsets.1)
			}
			
			path.removeLast()
		}
	}
	
	dfs(0, s)
	
	return output
}


extension String {
	subscript(_ idx:Int)->(String, String) {
		guard idx  < self.count else {return (String(),String())}
		let index = self.index(self.startIndex, offsetBy: idx + 1)
		let s1 = self.substring(to: index)
		let s2 = self.substring(from: index)
		return (s1,s2)
	}
	func isPalindrome()->Bool{
		let inverse = self.reversed().reduce("") { result, char in
			return (result + String(char))
		}
		return self == inverse
	}
}

print(partition("a"))
print("aab".isPalindrome())
print("hello"[0])
print("hello"[1])
print("hello"[2])
print("hello"[3])
print("hello"[4])
print("hello"[5])

//: [Next](@next)
