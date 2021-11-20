//: [Previous](@previous)

import Foundation

/* This algorithm performs an inOrder traversal using a stack instead of recursion.
 
 given the three:
             10
           /   \
          5     15
         /\    / \
        3  6  13 17
 */
let binaryTree = BinaryTree(root: 10)

binaryTree.insert(5)
binaryTree.insert(3)
binaryTree.insert(6)

binaryTree.insert(15)
binaryTree.insert(13)
binaryTree.insert(17)




extension BinaryTree {
    public func inOrderWithStack()-> [Int] {
        var it: Node? = self.root
        var stack:[Node] = []
        var result: [Int] = []
        
        while it != nil || stack.isEmpty == false {
            while it != nil {
                stack.append(it!)
                it = it?.left
            }
            let node = stack.removeLast()
            result.append(node.value)
            it = node.right
        }
        return result
    }
}


let traversal = binaryTree.inOrderWithStack()
print(traversal)


//: [Next](@next)
