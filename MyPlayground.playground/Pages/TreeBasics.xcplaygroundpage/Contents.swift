//: [Previous](@previous)

import Foundation

class TreeNode {  // More explicit name
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}



let tree = TreeNode(5,
      left: TreeNode(3, left: TreeNode(1)),
      right: TreeNode(8)
  )

func maxDepth(_ root: TreeNode?) -> Int {
    guard let node = root else { return 0 }
    let leftDepth = maxDepth(node.left)
    let rightDepth = maxDepth(node.right)
    // I need to choose the depthest child
    return 1 + max(leftDepth, rightDepth)
}

func printTree(_ node: TreeNode?) {
    guard let node = node else {return}
    var array: [[Int]] = []
    
    func printHelper(level: Int){
        
    }
}

func invert(_ node: TreeNode?) {
    guard let node = node else { return }
    invert(node.left)
    invert(node.right)
    let buffer = node.left
    node.left = node.right
    node.right = buffer
    
    return
}


print(tree)
invert(tree)
print(tree)


//: [Next](@next)
