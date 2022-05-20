//: [Previous](@previous)

import Foundation
let input = [10, 5, 15, 3,6, 1,4,20,17,25]
var root:TreeNode? = nil
for val in input {
	if root == nil {
		root = TreeNode(val)
	} else {
		root?.insert(val)
	}
}
public extension TreeNode {
	public func getInOrder() -> [Int] {
		var output:[Int] = []
		traverse(self)
		func traverse(_ node: TreeNode?){
			guard node != nil else {return}
			traverse(node?.left)
			output.append(node!.val)
			traverse(node?.right)
		}
		return output
	}
	
	public func getPreOrder() -> [Int]{
		var output:[Int] = []
		traverse(self)
		func traverse(_ node: TreeNode?){
			guard node != nil else {return}
			output.append(node!.val)
			traverse(node?.left)
			traverse(node?.right)
		}
		return output
	}
}

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
	var preorder = preorder
	
	func buildSubTree(_ array:[Int], target: Int)-> TreeNode?{
		let newNode = TreeNode(target)
		let partitions = partition(target, array: array)
		let left = partitions.left
		let right = partitions.right
		
		if left.isEmpty {
			newNode.left = nil
		} else {
			newNode.left = buildSubTree(left, target: preorder.removeFirst())
		}
		
		if right.isEmpty {
			newNode.right = nil
		} else {
			newNode.right = buildSubTree(right, target: preorder.removeFirst())
		}
		
		return newNode
	}
	func partition(_ target:Int, array:[Int])->(left:[Int], right: [Int]){
		guard array.count > 1 else { return ([],[])}
		
		if let idx = array.firstIndex(of: target){
			let left = Array(array[0..<idx])
			let right = Array(array[idx+1..<array.count])
			return (left, right)
		}
		return ([],[])
	}
	
	return buildSubTree(inorder, target: preorder.removeFirst())
}



let inOrder = root?.getInOrder() ?? []
print(inOrder)
let preOrder = root?.getPreOrder() ?? []
print(preOrder)

if let node = buildTree(preOrder, inOrder) {
	node.preOrder()
}



//: [Next](@next)
