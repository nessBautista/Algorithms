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

func levelTraversal(_ node: TreeNode?)-> [[Int]] {
	var output:[[Int]] = []
	let level = 0
	func dfs(_ node: TreeNode?, _ level: Int){
		guard node != nil else {
			return
		}
		
		if level == output.count {
			output.append([])
			output[level].append(node!.val)
		} else {
			output[level].append(node!.val)
		}
		
		dfs(node?.left, level + 1)
		dfs(node?.right, level + 1)
	}
	
	dfs(node, level)
	print(output)	
	return output
}

levelTraversal(root)


//: [Next](@next)
