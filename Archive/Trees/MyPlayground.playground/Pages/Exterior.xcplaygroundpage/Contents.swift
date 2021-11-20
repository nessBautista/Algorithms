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
    
    func exterior()-> [String]{
        var result:[String] = [self.root.val]
        leftExterior(&result, node: self.root.left, isBoundary: true)
        rightExterior(&result, node: self.root.right, isBoundary: true)
        return result
    }
    
    func leftExterior(_ result: inout[String], node:Node?, isBoundary:Bool){
        guard let node = node else {return}
        
        if (isBoundary || isLeaf(node)) {
            result.append(node.val)
        }
        leftExterior(&result, node: node.left, isBoundary: isBoundary)
        leftExterior(&result, node: node.right, isBoundary: isBoundary && node.left == nil)
    }
    func rightExterior(_ result:inout [String], node:Node?, isBoundary:Bool){
        guard let node = node else {return}
        
        rightExterior(&result, node: node.left, isBoundary: isBoundary && node.right == nil)
        rightExterior(&result, node: node.right, isBoundary: isBoundary)
        
        if isBoundary || isLeaf(node){
            result.append(node.val)
        }
        
    }
           
    func isLeaf(_ node:Node)->Bool{
        return node.left == nil && node.right == nil
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


let tree = Tree(root:a)
print(tree.exterior())


//: [Next](@next)
