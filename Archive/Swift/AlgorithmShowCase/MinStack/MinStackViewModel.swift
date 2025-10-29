//
//  MinStackViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 17/06/22.
//

import Foundation
import Combine
import SwiftUI
struct StackItem: Hashable {
	var min: Int
	var value: Int
	var id: UUID = UUID()
	init(min: Int, value: Int) {
		self.min = min
		self.value = value
	}
}

class MinStackViewModel: ObservableObject {
	let minStack = MinStack()
	@Published var stack:[StackItem] = []
	@Published var min = Int.max
	
	func pushRandom(){
		let newItem = Int.random(in: 0...1000)
		self.minStack.push(newItem)
		self.stack = self.minStack.stack
		self.min = self.minStack.min
	}
	
	func popLast(){
		self.minStack.pop()
		self.stack = self.minStack.stack
	}
}


class MinStack {
	var min: Int = Int.max
	var stack:[StackItem] = []
	init() {
		
	}
	
	func push(_ val: Int) {
		// update min
		if val < min {
			min = val
		}
		stack.append(StackItem(min:min, value:val))
	}
	
	func pop() {
		_ = stack.popLast()
		if let last = stack.last {
			min = last.min < min ? last.min : min
		} else {
			min = Int.max
		}
	}
	
	func top() -> Int {
		self.stack.last?.value ?? 0
	}
	
	func getMin() -> Int {
		self.stack.last?.min ?? 0
	}
}
