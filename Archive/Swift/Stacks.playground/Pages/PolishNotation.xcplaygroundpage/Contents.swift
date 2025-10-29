//: [Previous](@previous)

import Foundation



func evalRPN(_ tokens: [String]) -> Int {
	var stack: [Int] = []
	
	for token in tokens {
		if !isOperation(token){
			stack.append(getNumber(token))
		} else {
			let r = stack.popLast() ?? 0
			let l = stack.popLast() ?? 0
			let result = applyOperation(op:token, l,r)
			stack.append(result)
		}
	}
	
	func applyOperation(op: String, _ l: Int, _ r: Int)->Int{
		switch op {
		case "+":
			return l + r
		case "-":
			return l - r
		case "*":
			return l * r
		case "/":
			guard r != 0 else {return 0}
			return l / r
		default:
			return 0
		}
	}
	
	return stack.last ?? 0
}


func isOperation(_ token: String)->Bool {
	return token == "+" || token == "-" || token == "*" || token == "/"
}

func getNumber(_ token:String) -> Int {
	return Int(token) ?? 0
}
let tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
evalRPN(tokens)

//: [Next](@next)
