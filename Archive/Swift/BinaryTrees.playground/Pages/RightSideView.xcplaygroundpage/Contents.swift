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
func rightSideView(_ root: TreeNode?) -> [Int] {
	var reg:[[Int]] = []
	var output:[Int] = []
	traverse(root, 0)
	
	func traverse(_ node: TreeNode?, _ level: Int) {
		guard node != nil else {return}
		register(node!.val, level)
		traverse(node?.left,level + 1)
		traverse(node?.right,level + 1)
	}
	
	func register(_ value:Int, _ level: Int) {
		if level >= reg.count {
			reg.append([])
		}
		reg[level].append(value)
	}
	
	traverse(root, 0)
	for row in reg {
		print(row)
		if let last = row.last {
			output.append(last)
		}
	}
	return output
}

rightSideView(root)
//: [Next](@next)
