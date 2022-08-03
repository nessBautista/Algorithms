//
//  FibonacciViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 09/06/22.
//

import Foundation
class FibonacciViewModel: ObservableObject {
	
	@Published var data:[String] = []
	
	let fibo = Fibonacci()
	init(){
		
	}
	
	func loadData(){
		self.data = (0...10).map({"\(self.fibo.fibonacci($0))"})
	}
	
	func nextItem(_ n: Int) {
		// fibonacci
		let newItem = "\(self.fibo.fibonacci(n))"
		// append
		self.data.append(newItem)
		
	}
}

class Fibonacci {
	var memo: [Int: Int] = [:]
	
	func fibonacci(_ n: Int) -> Int {
		// base case
		if let output = memo[n] {
			return output
		}
		if n == 0 { return 0 }
		if n == 1 { return 1 }
		
		let output = fibonacci(n - 1) + fibonacci(n - 2)
		memo[n] = output
		
		return output
	}
}
