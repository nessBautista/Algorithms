//: [Previous](@previous)

import Foundation

func generateParenthesis(_ n: Int) ->[String]{
	var result:[String] = []
	var stack:[String] = [] {
		didSet {
			print(stack)
		}
	}
	
	
	func traverse(cOpen:Int, cClose:Int, stack: inout [String]){
		//base case
		guard cOpen <= n, cClose <= cOpen else {
			return
		}
		// You only care for complete pairs
		if (cOpen == n && cClose == n){
			var output = String()
			stack.forEach({output.append($0)})
			result.append(output)
		}
		
		push("(")
		traverse(cOpen: cOpen + 1, cClose: cClose, stack: &stack)
		pop()
		
		push(")")
		traverse(cOpen: cOpen, cClose: cClose + 1, stack: &stack)
		pop()
		
		func push(_ s: String){
			stack.append(s)
			print(stack)
		}
		func pop(){
			stack.popLast()
			print(stack)
		}
		
	}
	traverse(cOpen: 0, cClose: 0, stack: &stack)
	return result
}
let result = generateParenthesis(3)
print("result: \(result)")



//func traverseStacks(_ n: Int){
//
//	for i in 1...n {
//		var output = ""
//		var sOpen:[String] = Array(repeating: "(", count: n)
//		var sClose:[String] = Array(repeating: ")", count: n)
//
//		traverseStack(&sOpen, output: &output, count: i)
//		traverseStack(&sClose, output: &output, count: i)
//		print(output)
//	}
//
//}
//
//func traverseStack(_ s: inout [String], output: inout String, count:Int) {
//	guard !s.isEmpty else {return}
//	guard count != 0 else {return}
//	output += s.popLast() ?? ""
//	traverseStack(&s, output: &output, count:count - 1)
//}
//printCOmbinations(n: 3)
//: [Next](@next)
