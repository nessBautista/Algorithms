//: [Previous](@previous)

import Foundation

class Node {
	var value:Int
	var right:Node?
	var left:Node?
	init(value: Int) {
		self.value = value
	}
}

class Tree {
	var root: Node?
	
	
	func insert(_ val: Int){
		guard let node = root  else {
			self.root = Node(value: val)
			return
		}
		
		insertHelper(node, val)
	}
	
	func insertHelper(_ node: Node, _ val: Int) {
		if val < node.value {
			if node.left == nil {
				let newNode = Node(value: val)
				node.left = newNode
			} else {
				self.insertHelper(node.left!, val)
			}
		}
		else if val > node.value {
			if node.right == nil {
				let newNode = Node(value: val)
				node.right = newNode
			} else {
				self.insertHelper(node.right!, val)
			}
		} else {
			print("Dup")
		}
	}
	
	func inOrder(){
		guard root != nil else {return}
		self.inOrderHelper(self.root)
	}
	func inOrderHelper(_ node:Node?){
		guard node != nil  else {return}
		inOrderHelper(node?.left)
		print(node!.value)
		inOrderHelper(node?.right)
	}
	
	func byLevel(){
		var register:[Int: String] = [:]
		byLevelHelper(self.root, level: 0, register: &register)
		
		for key in 0..<register.count{
			print(register[key])
		}
	}
	
	func byLevelHelper(_ node: Node?, level:Int, register: inout [Int: String]) {
		guard node != nil else {return}
		
		byLevelHelper(node?.left, level: level + 1, register: &register)
		
		if register[level] == nil {
			register[level] = "\(node!.value)->"
		} else {
			register[level]?.append("\(node!.value)->")
		}
		
		byLevelHelper(node?.right, level: level + 1, register: &register)
	}
}

let tree = Tree()
tree.insert(10)

tree.insert(5)
tree.insert(2)
tree.insert(1)
tree.insert(3)
tree.insert(6)

tree.insert(15)
tree.insert(12)
tree.insert(16)
tree.insert(16)

tree.inOrder()
print("--------------")
tree.byLevel()

//: [Next](@next)
