//: [Previous](@previous)

import Foundation

func maxDepth(_ root: TreeNode?) -> Int {
	
	func bfs(_ node: TreeNode?) -> Int{
		guard node != nil else {return 0}
		let l = bfs(node?.left)
		let r = bfs(node?.right)
		return max(l, r) + 1
	}
	return bfs(root)
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
root?.inOrder()
maxDepth(root)
//: [Next](@next)
