//: [Previous](@previous)

import Foundation

let input = [4,2,7,1,3,6,9]
var root:TreeNode? = nil
for val in input {
	if root == nil {
		root = TreeNode(val)
	} else {
		root?.insert(val)
	}
}
root?.inOrder()

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
	var diameter = 0
	_ = dfs(root)
	func dfs(_ node: TreeNode?) -> Int {
		guard node != nil else {return -1}
		let l = dfs(node?.left)
		let r = dfs(node?.right)
		let d = (l + r + 2)
		diameter = d > diameter ? d : diameter
		return max(l,r) + 1
	}

	return diameter
}
//
diameterOfBinaryTree(root)
//print(root?.right?.val)
//: [Next](@next)
