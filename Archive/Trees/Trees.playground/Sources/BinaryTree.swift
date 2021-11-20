import Foundation

//This is a basic implementation of a Binary Tree
public class Node {
    public var value: Int
    public var left: Node?
    public var right: Node?
    init(_ val: Int) {
        self.value = val
    }
}

extension Node: Comparable {
    public static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.value < rhs.value
    }
    
    public static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.value == rhs.value
    }
}

public class BinaryTree {
    open var root: Node
    enum InsertionType {
        case less
        case equal
        case greater
        
        init(_ newNode: Node, _ node: Node) {
            if newNode < node {
                self = .less
            } else if newNode == node {
                self = .equal
            } else {
                self = .greater
            }
        }
    }
    
    public init(root: Int) {
        let rootNode = Node(root)
        self.root = rootNode
    }
    
    public func insert(_ val: Int) {
        let newNode = Node(val)
        insertHelper(newNode, self.root)
    }
    
    
    private func insertHelper(_ newNode: Node, _ node: Node) {
        let insertionType = InsertionType(newNode, node)
        switch insertionType {
        case .less:
            guard let left = node.left else {
                node.left = newNode
                return
            }
            insertHelper(newNode, left)
        case .equal:
            print("Duplicated")
        case .greater:
            guard let right = node.right else {
                node.right = newNode
                return
            }
            insertHelper(newNode, right)
        }
    }
    
    public func inOrder() {
        inOrderHelper(root)
    }
    
    private func inOrderHelper(_ node: Node?){
        guard let node = node else { return }
        inOrderHelper(node.left)
        print(node.value)
        inOrderHelper(node.right)
    }
    
}
