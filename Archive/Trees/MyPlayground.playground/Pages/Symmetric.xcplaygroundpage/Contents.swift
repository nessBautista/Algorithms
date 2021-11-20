//: [Previous](@previous)

//: [Previous](@previous)

import Foundation

class Node
{
    var val:Int
    var right: Node?
    var left: Node?
    
    init(_ val:Int){
        self.val = val
    }
}

class Tree
{
    let root: Node
    
    init(root:Node){
        self.root = root
    }
    
    func inOrder(){
        inOrderHelper(self.root)
    }
    
    func inOrderHelper(_ node:Node?){
        guard let n = node else {return}
        inOrderHelper(n.left)
        print(n.val)
        inOrderHelper(n.right)
    }
    
    func isSymmetric()->Bool{
        return isSymmetricHelper(node1:self.root.left, node2: self.root.right)
    }
    func isSymmetricHelper(node1:Node?, node2:Node?)->Bool {
        
        //base case
        guard node1 != nil && node2 != nil  else {return true}
        //check level
        let level = node1?.val == node2?.val
        //check leafs
        let children = isSymmetricHelper(node1: node1?.right, node2:node2?.left) && isSymmetricHelper(node1: node1?.left, node2: node2?.right)
        return level && children
        
    }
}

let a = Node(314)
let b = Node(6)
let c = Node(2)
let d = Node(3)
let e = Node(6)
let f = Node(2)
let g = Node(3)

a.left = b
a.right = e

b.right = c
c.right = d

e.left = f
f.left = g

let tree = Tree(root:a)
tree.inOrder()
tree.isSymmetric()
//: [Next](@next)
