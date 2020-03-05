import UIKit

class Node<T: Comparable> {
    var val: T
    var left: Node?
    var right: Node?
    
    init(_ value: T) {
        self.val = value
    }
}

class Tree<T: Comparable> {
    var root: Node<T>
    init(_ value: T){
        self.root = Node(value)
    }
    
    func insert(_ val:T) {
        self.insertHelper(self.root, val)
    }
    
    func insertHelper( _ node: Node<T>?, _ val: T) {
        guard let node = node else {return}
        if val < node.val {
            if node.left == nil {
               node.left = Node(val)
            } else {
                self.insertHelper(node.left, val)
            }
        } else if val > node.val {
            if node.right == nil {
               node.right = Node(val)
            } else {
                self.insertHelper(node.right, val)
            }
        } else if val == node.val {
            print("duplicated")
        }
    }
    
    func inOrder() {
        self.inOrderHelper(node: self.root)
    }
    func inOrderHelper(node: Node<T>?){
        if node == nil {
            return
        }
        self.inOrderHelper(node: node?.left)
        if let val = node?.val {
            print("\(val)")
        }
        
        self.inOrderHelper(node: node?.right)
    }
}


let tree = Tree(50)
tree.insert(30)
tree.insert(25)
tree.insert(35)
tree.insert(60)
tree.insert(70)
tree.insert(55)
tree.inOrder()

let tree2 = Tree("A")
tree2.insert("B")
tree2.insert("I")

tree2.insert("C")
tree2.insert("F")
tree2.insert("J")
tree2.insert("O")

tree2.insert("D")
tree2.insert("E")
tree2.insert("G")
tree2.insert("K")
tree2.insert("P")

tree2.insert("H")
tree2.insert("L")
tree2.insert("N")

tree2.insert("M")

tree2.inOrder()

