//: [Previous](@previous)

import Foundation
public class TreeNode {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init() { self.val = 0; self.left = nil; self.right = nil; }
	public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
	public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
		self.val = val
		self.left = left
		self.right = right
	}
	
	func insert(_ val:Int) {
		insertHelper(val, self)
		
		func insertHelper(_ val:Int, _ node: TreeNode?) {
			guard node != nil else {return}
			if val < node!.val {
				if node?.left == nil{
					node?.left = TreeNode(val)
				} else {
					insertHelper(val, node?.left)
				}
			} else if val > node!.val {
				if node?.right == nil{
					node?.right = TreeNode(val)
				} else {
					insertHelper(val, node?.right)
				}
			} else {
				print("duplicated")
			}
		}
	}
	
	func inOrder(){
		var output:[Int] = []
		traverse(self)
		func traverse(_ node: TreeNode?){
			guard node != nil else {return}
			traverse(node?.left)
			output.append(node!.val)
			traverse(node?.right)
		}
		print(output)
	}
	
	func preOrder(){
		var output:[Int] = []
		traverse(self)
		func traverse(_ node: TreeNode?){
			guard node != nil else {return}
			output.append(node!.val)
			traverse(node?.left)
			
			traverse(node?.right)
		}
		print(output)
	}
}

let input = [4,2,7,1,3,6,9]
var root:TreeNode? = nil
for val in input {
	if root == nil {
		root = TreeNode(val)
	} else {
		root?.insert(val)
	}
}

root?.preOrder()

func invertTree(_ root: TreeNode?) -> TreeNode? {
	guard root != nil else {return nil}
	traverse(root)
	func traverse(_ node: TreeNode?) {
		guard node != nil else {return}
		traverse(node?.left)
		traverse(node?.right)
		invert(node!)
	}
	
	func invert(_ node: TreeNode){
		let temp: TreeNode? = node.right
		node.right = node.left
		node.left = temp
	}
	
	return root
}

print("done")

//: [Next](@next)
