//: [Previous](@previous)

import Foundation

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

//: [Next](@next)
