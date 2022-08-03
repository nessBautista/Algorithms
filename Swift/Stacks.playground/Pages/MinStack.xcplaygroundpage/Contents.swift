//: [Previous](@previous)

import Foundation

class MinStack {
	var min: Int = Int.max
	var stack:[(min:Int, value:Int)] = []
	init() {
		
	}
	
	func push(_ val: Int) {
		if val < min {
			min = val
		}
		stack.append((min: min, value: val))
	}
	
	func pop() {
		stack.popLast()
		if let last = stack.last {
			min = last.min
		}
	}
	
	func top() -> Int {
		if let last = stack.last {
			return last.value
		}
		return 0
	}
	
	func getMin() -> Int {
		return min
	}
}

//: [Next](@next)
