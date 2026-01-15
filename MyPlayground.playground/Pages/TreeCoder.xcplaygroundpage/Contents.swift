//: [Previous](@previous)

import Foundation

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
    public init(_ val: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

func serialize(_ root: TreeNode?) -> String {
    func serialize_helper(_ node: TreeNode?, _ res: inout [Int?]){
        guard let node = node else {
            res.append(nil)
            return
        }
        res.append(node.val)
        serialize_helper(node.left, &res)
        serialize_helper(node.right, &res)
    }
    
    
    
    var buff:[Int?] = []
    serialize_helper(root, &buff)
    let strBuff = buff.map{
        if let n = $0 {return String(n) }
        return "nil"
    }
    
    
    return strBuff.joined(separator: ",")
    
}

func deserialize(data:String) -> TreeNode? {
    var stack = data.split(separator: ",").map{String($0)}
    
    func deserialization_helper(_ stack: inout [String]) -> TreeNode? {
        guard !stack.isEmpty else {return nil}
        let curr = stack.removeFirst()
        guard curr != "nil" else { return nil}
        let node = TreeNode(Int(curr)!)
        node.left = deserialization_helper(&stack)
        node.right = deserialization_helper(&stack)
        return node
    }
    
    return deserialization_helper(&stack)
}

let tree = TreeNode(5,
    left: TreeNode(3, left: TreeNode(1)),
    right: TreeNode(8)
)
print(serialize(tree))

var str = "5,3,1,nil,nil,nil,8,nil,nil"
var str_array = str.split(separator: ",")
print(str_array)

/*
    5
   / \
  3   8
 /
1
 */


//: [Next](@next)
