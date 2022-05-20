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

func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
	
	// traverse referencing root
	func traverse(_ n1: TreeNode?, _ n2: TreeNode? ) -> Bool{
		guard n1 != nil else {return false}
		guard n2 != nil else {return true}
		if n1!.val == n2!.val {
			print("found same:\(n1!.val)")
			if isSameTree(n1, n2) {
				print("true")
				return true
			}
		}
		
		return traverse(n1?.left, n2) || traverse(n1?.right, n2)
	}
	
	// traverse referencing subtree
	func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
		if p == nil && q == nil { return true }
		guard let p = p, let q = q  else {return false}
		
		let l = isSameTree(p.left, q.left)
		let r = isSameTree(p.right, q.right)
		if l && r {
			return p.val == q.val
		}
		return false
	}

	
	return traverse(root, subRoot)
	
}

isSubtree(root, nil)
//: [Next](@next)
