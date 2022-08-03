//
//  MainViewModel.swift
//  TwitterDemo
//
//  Created by Nestor Hernandez on 22/06/22.
//

import Foundation
import Combine

struct FeedItem: Identifiable {
	var id: Int
	var value: String
}

class MainViewModel: ObservableObject {
	let repository: TwitterRepository
	let fibonacci:Fibonacci = Fibonacci()
	@Published var data:[FeedItem]
	init(repository: TwitterRepository){
		self.repository = repository
		self.data = (0...1).map({FeedItem(id: $0, value: "\($0)")})
		
	}
	
	func loadData(_ item: FeedItem){
		guard item.id == self.data.count - 1 else {
			return
		}
		let newItem = FeedItem(id: item.id + 1,
							   value: "\(self.fibonacci.fibonacci(item.id + 1))")
		self.data += [newItem]
	}
}
           

class Fibonacci {
	var memo: [Int: Int] = [:]
	func fibonacci(_ n: Int)->Int{
		if let fibo = memo[n]{
			return fibo
		}
		if n == 0 {return 0}
		if n == 1 {return 1}
		let fibo_n = fibonacci(n-1) + fibonacci(n-2)
		memo[n] = fibo_n
		return fibo_n
	}
}
