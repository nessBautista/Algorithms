//: [Previous](@previous)

import Foundation
protocol Stack {
	associatedtype Element
	var count: Int {get}
	mutating func push(_ element: Element)
	mutating func pop()->Element?
}

struct IntStack: Stack {
	var count: Int
	private var values:[Int] = []
	mutating func push(_ element: Int) {
		values.append(element)
	}
	mutating func pop()->Int?{
		values.popLast()
	}
}

struct GenericStack<Item>: Stack{
	//typealias Element = Item
	private var values: [Item] = []
	
	var count: Int {
		values.count
	}
	
	mutating func push(_ element: Item) {
		values.append(element)
	}
	
	mutating func pop() -> Item? {
		values.popLast()
	}
}

extension Array: Stack {
	mutating func push(_ element: Element) {
		self.append(element)
	}
	
	mutating func pop() -> Element? {
		self.popLast()
	}
}

func executeOperation<Container:Stack>(container:Container){
	
}

var stringStack =  GenericStack<String>()
stringStack.push("a")
stringStack.push("b")

var intStack =  GenericStack<Int>()
intStack.push(1)
intStack.push(2)

//: [Next](@next)
