//: [Previous](@previous)

import Foundation
struct Item: Comparable {
	var value: Character
	var count: Int
	
	static func ==(lhs: Item, rhs: Item)-> Bool{
		(lhs.count == rhs.count)
	}
	
	static func <(lhs: Item, rhs: Item)-> Bool{
		(lhs.count < rhs.count)
	}
}

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
	var output = [Character]()
	var heap = Heap<Item>(elements: [], priorityFunction: >)
	func initialize(){
		var dict:[Character: Int] = [:]
		for c in tasks {
			if dict[c] == nil {
				dict[c] = 1
			} else {
				dict[c]! += 1
			}
		}
		
		for (char, counter) in dict {
			let item = Item(value: char, count: counter)
			heap.enqueue(item)
		}
		
	}
	func executeOps(){
		var stack:[(item: Item, time: Int)] = []
		var t = 0
		while !heap.isEmpty || !stack.isEmpty {
			
			if var item = heap.dequeue(){
				output.append(item.value)
				let itemCount = item.count
				if (itemCount - 1) > 0 {
					let time = t + n
					item.count -= 1
					stack.append((item, time))
				}
			} else {
				output.append(" ")
			}
			
			print(t, stack)
			while !stack.isEmpty {
				if let first = stack.first,
					first.time == t  {
					let firstItem = stack.removeFirst()
					heap.enqueue(firstItem.item)
				} else {
					break
				}
			}
			t += 1
		}
	}
	initialize()
	executeOps()
	return output.count
}
let tasks:[Character] = ["A","A","A","B","B","B"]
let n = 2
leastInterval(tasks, n)
//: [Next](@next)
