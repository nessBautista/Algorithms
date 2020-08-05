//: [Previous](@previous)

import Foundation

class Node
{
    var val:String
    var right: Node?
    var left: Node?
    
    init(_ val:String){
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
    
    func isBalanced()->Bool {
        let isBalanced = isBalancedHelper(node: self.root)
        
        return isBalanced.0
    }
    
    func isBalancedHelper(node:Node?) -> (Bool, Int){
        //base case
        if node == nil {
            return (true, -1)
        }
        
        //traverse left subtree
        let left = isBalancedHelper(node: node?.left)
        if left.0 == false {
            return (false, 0) //left subtree is not balanced
        }
        let right = isBalancedHelper(node: node?.right)
        if right.0 == false {
            return (false, 0) //right subtree is not balanced
        }
        let isBalanced = abs(left.1 - right.1) <= 1
        let level = max(left.1, right.1) + 1
        return (isBalanced, level)
    }
}


let a = Node("A")
let b = Node("B")
let c = Node("C")
let d = Node("D")
let e = Node("E")
let f = Node("F")
let g = Node("G")
let h = Node("H")
let i = Node("I")
let j = Node("J")
let k = Node("K")
let l = Node("L")
let m = Node("M")
let n = Node("N")
let o = Node("O")

a.left = b
a.right = k

b.left = c
b.right = h

c.left = d
c.right = g

d.left = e
d.right = f

h.left = i
h.right = j

k.left = l
k.right = o

l.left = m
l.right = n

let uno = Node("1")
let dos = Node("2")
let tres = Node("3")


g.left = uno
i.right = dos
dos.left = tres
let tree = Tree(root:a)
tree.inOrder()

print("isTreeBalanced=\(tree.isBalanced())")
//: [Next](@next)
