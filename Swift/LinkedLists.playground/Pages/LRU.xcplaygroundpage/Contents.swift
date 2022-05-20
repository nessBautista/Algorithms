//: [Previous](@previous)

import Foundation
import Darwin

class Node {
	var value:Int
	var key:Int
	var next:Node?
	var prev: Node?
	
	init(_ key:Int,_ value:Int){
		self.key = key
		self.value = value
	}
}
class LRUCache {
	var capacity: Int
	var LRU:Node = Node(0,0)
	var MRU:Node = Node(0,0)
	var dict: [Int: Node] = [:]
	init(_ capacity: Int) {
		self.capacity = capacity
		// Initial state of pointers
		LRU.next =  MRU
		MRU.prev =  LRU
	}
	
	func printCache(){
		var output = String()
		var curr: Node? = LRU
		while curr != nil {
			output += "(\(curr!.key)-\(curr!.value))->"
			curr = curr?.next
		}
		print(output)
	}
	// Insert at rigth to update MRU
	private func insertAtRight(_ node: Node) {
		let prev = MRU.prev
		prev?.next = node
		node.prev = prev
		MRU.prev = node
		node.next = MRU
	}
	
	// Remove from any place in the list
	private func remove(_ node: Node?) {
		let prev = node?.prev
		let next = node?.next
		prev?.next = next
		next?.prev = prev
		node?.next = nil
		node?.prev = nil
	}
	
	func get(_ key: Int) -> Int {
		if let node = self.dict[key] {
				// Update this node as MRU
				remove(node)
				insertAtRight(node)
			print("after get")
			self.printCache()
			return node.value
		}
		print("after get")
		self.printCache()
		return -1
	}
	
	func put(_ key: Int, _ value: Int) {
		if let node = dict[key] {
			// Exist and should be updated as MRU
			remove(node)
			node.value = value
			insertAtRight(node)
		} else if dict.count < capacity {
			// doesn't exist and there is space
			let newNode = Node(key, value)
			self.dict[key] = newNode
			insertAtRight(newNode)
		}
		else if dict.count >= capacity {
			// we reached capacity and most delete LRU
			// remove it from list and dict
			self.dict[LRU.next!.key] = nil
			remove(LRU.next)
			
			// create new and insert
			let newNode = Node(key, value)
			insertAtRight(newNode)
			self.dict[key] = newNode
		}
		print("after put")
		self.printCache()
		
	}
}

let lruCache = LRUCache(2)
lruCache.put(1,1)
lruCache.put(2,2)
print(lruCache.get(1))
lruCache.put(3,3)
print(lruCache.get(2))
lruCache.put(4,4)
print(lruCache.get(1))
print(lruCache.get(3))
print(lruCache.get(4))
print("done")

//: [Next](@next)
