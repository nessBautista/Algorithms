//: [Previous](@previous)

import Foundation
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
	var output: TreeNode? = nil
	guard root != nil else {return nil}
	guard p != nil else {return nil}
	guard q != nil else {return nil}
	
	bfs(root, p!.val, q!.val)
	func bfs(_ node: TreeNode?, _ p: Int, _ q: Int) -> Bool{
		guard output == nil else {return false}
		guard node != nil else {return false}
		let l = bfs(node?.left, p, q)
		let r = bfs(node?.right, p, q)
		if l && r {
			output = node
		}
		return (node!.val == p) || (node!.val == q)
	}
	return output
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

//: [Next](@next)
