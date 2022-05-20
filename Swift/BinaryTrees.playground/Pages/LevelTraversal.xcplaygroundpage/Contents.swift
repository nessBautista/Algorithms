//: [Previous](@previous)

import Foundation

func levelOrder(_ root: TreeNode?) -> [[Int]] {
	var output = [[Int]]()
	
	func bfs(_ node: TreeNode?, _ level: Int){
		guard node != nil else {return}
		print("\(level)vs\(output.count)")
		if level >= output.count {
			output.append([])
			output[level].append(node!.val)
		} else {
			output[level].append(node!.val)
		}
		
		bfs(node?.left, level + 1)
		bfs(node?.right, level + 1)
	}
	bfs(root, 0)
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
print(levelOrder(root))
//: [Next](@next)
