import UIKit

//: ![Given the following node](MultiNodeTree.png)

class Node {
	var children:[Node] = []
	var value: Int
	
	init(_ value:Int){
		self.value = value
	}
	
	static func buildTree() -> Node {
		let node1 = Node(1)
		let node2 = Node(2)
		let node3 = Node(3)
		let node4 = Node(4)
		let node6 = Node(6)
		
		node1.children = [node2, node4, node6]
		node2.children = [node3]
		return node1
	}
}


func ternaryTreePath(_ node: Node?) -> [String] {
	var output:[String] = []
	
	func dfs(_ node:Node?, path: String) {
		guard node != nil else {return}
		guard node!.children.count > 0 else {
			output.append(path + "\(node!.value) ->")
			return
		}
		for child in node!.children {
			dfs(child, path: path + "\(node!.value) ->")
		}
	}
	dfs(node, path: String())
	return output
}

func ternaryTreePath_spaceSavy(_ node: Node?) -> [String] {
	var output:[String] = []
	var path:[String] = []
	
	func dfs(_ node:Node?, path: inout [String]) {
		guard node != nil else {return}
		guard node!.children.count > 0 else {
			//path.append("\(node!.value)")
			let branch = (path + ["\(node!.value)"]).joined(separator: "->")
			//path.popLast()			
			output.append(branch)
			return
		}
		for child in node!.children {
			path.append("\(node!.value)")
			dfs(child, path: &path)
			path.popLast()
		}
	}
	dfs(node, path: &path)
	return output
}
let tree = Node.buildTree()
print(ternaryTreePath(tree))
print(ternaryTreePath_spaceSavy(tree))



print("Done")
