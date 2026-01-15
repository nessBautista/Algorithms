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

func lowestCommonAncestor(
    _ root: TreeNode?,
    _ p: TreeNode?,
    _ q: TreeNode?
) -> TreeNode? {
    guard let node = root else {return nil}
    guard let pval = p?.val else {return nil}
    guard let qval = q?.val else {return nil}
    return lca(node,pval, qval)
}


func lca(_ node: TreeNode?, _ p: Int, _ q: Int) -> TreeNode? {
    guard let node = node else {return  nil}
    
    if node.val == p || node.val == q {
        return node
    }
        
    let left = lca(node.left, p, q)
    let right = lca(node.right,p, q)
    
    
    if left != nil && right != nil {
        return node
    }
    return left ?? right
}

//: [Next](@next)
