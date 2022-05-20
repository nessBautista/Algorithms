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

func isValidBST(_ root: TreeNode?) -> Bool {
	var register: Int = Int.min
	var output = true
	inOrder(root)
	func inOrder(_ node: TreeNode?){
		guard output == true else {return}
		guard node != nil else {return}
		inOrder(node?.left)
		if node!.val <= register {
			output = false
		} else {
			register = node!.val
		}
		inOrder(node?.right)
	}
	return output
}
isValidBST(root)
//: [Next](@next)
