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
    var inOrder:[String] = []
    var preOrder:[String] = []
    init(root:Node){
        self.root = root
    }
    
    func traversal(){
        traversalHelper(self.root)
    }
    
    func traversalHelper(_ node:Node?){
        guard let n = node else {return}
        preOrder.append(n.val)
        traversalHelper(n.left)
        inOrder.append(n.val)
        traversalHelper(n.right)
    }
        
    func rebuild(inOrder:[String], preOrder:[String]) -> Node{
        var dict:[String:Int] = [:]
        for (idx,item) in inOrder.enumerated() {
            dict[item] = idx
        }
        return rebuildHelper(dict:dict, val:String, left:[String]?, right:[String]?) -> Node
    }
    
    func rebuildHelper(dict:[String:Int], val:String, left:[String]?, right:[String]?) -> Node {
        
    }
    
    func subarrays(head:String)-> ([String], [String]){
        
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

h.left = b
h.right = c

b.left = f
b.right = e

e.left = a

c.right = d

d.right = g

g.left = i



let tree = Tree(root:h)
tree.traversal()
print(tree.inOrder)
print(tree.preOrder)

//: [Next](@next)
