//: [Previous](@previous)

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
let n1 = ListNode(1)
let n2 = ListNode(2)
let n3 = ListNode(3)
let n4 = ListNode(4)
n1.next = n2
n2.next = n3
n3.next = n4

func printList(_ node: ListNode?) {
    var output = ""
    print_helper(node, &output)
    print(output)
    func print_helper(_ node: ListNode?, _ output: inout String) {
        guard let node = node else {return}
        output += "\(node.val)->"
        print_helper(node.next, &output)
    }
}

printList(n1)


func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var curr =  head
    
    while curr != nil {
        let temp = curr?.next
        curr?.next = prev
        prev = curr
        curr = temp
    }
    return prev
}

let reversed = reverseList(n1)
printList(reversed)
//: [Next](@next)
