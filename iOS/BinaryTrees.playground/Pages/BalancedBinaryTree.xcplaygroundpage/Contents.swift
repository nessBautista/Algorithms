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

func isBalanced(_ root: TreeNode?) -> Bool {
	guard root != nil else {return true}
	func traverse(_ node: TreeNode?) -> (height: Int, out: Bool) {
		guard node != nil else {return (0, true)}
		let l = traverse(node?.left)
		let r = traverse(node?.right)
		if !l.out || !r.out {
			return (0, false)
		}
		return (max(l.height, r.height) + 1 , abs(l.height - r.height) <= 1)
	}
	return traverse(root).out
}
isBalanced(root)
//: [Next](@next)
