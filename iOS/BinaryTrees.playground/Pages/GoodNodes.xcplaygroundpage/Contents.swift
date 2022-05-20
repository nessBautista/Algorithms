//: [Previous](@previous)

import Foundation

func goodNodes(_ root: TreeNode?) -> Int {
	guard root != nil else {return 0}
	var count = 0
	
	traverse(root, root!.val)
	func traverse(_ node: TreeNode?, _ max:Int) {
		guard node != nil else {return}
		let maxReference = node!.val > max ? node!.val : max
		if node!.val >= maxReference {
			count += 1
		}
		traverse(node?.left, maxReference)
		traverse(node?.right, maxReference)
	}
	
	return count
}

//: [Next](@next)
