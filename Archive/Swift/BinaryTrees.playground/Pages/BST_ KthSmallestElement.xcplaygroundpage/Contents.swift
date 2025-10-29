//: [Previous](@previous)

import Foundation
let input = [10, 5, 15, 2, 6]
var root:TreeNode? = nil
for val in input {
	if root == nil {
		root = TreeNode(val)
	} else {
		root?.insert(val)
	}
}

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
	var idx = 0
	var output:Int? = nil
	inOrder(root)
	func inOrder(_ node: TreeNode?){
		guard output == nil else {return}
		guard node != nil else {return}
		inOrder(node?.left)
		idx += 1
		if idx == k {
			
			output = node!.val
		}
		inOrder(node?.right)
	}
	return output ?? -1
}

//: [Next](@next)
root?.inOrder()
kthSmallest(root, 4)
