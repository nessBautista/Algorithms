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


let n1 = ListNode(1)
let n2 = ListNode(3)
let n3 = ListNode(6)
let n4 = ListNode(9)
n1.next = n2
n2.next = n3
n3.next = n4


let m1 = ListNode(2)
let m2 = ListNode(4)
let m3 = ListNode(5)
let m4 = ListNode(10)
m1.next = m2
m2.next = m3
m3.next = m4


func mergeLists(_ n1: ListNode?, _ n2: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var tail: ListNode? = dummy
    var l1: ListNode? = n1
    var l2: ListNode? = n2
    
    while l1 != nil && l2 != nil {
        if l1!.val < l2!.val {
            tail?.next = l1
            l1 = l1?.next
        } else {
            tail?.next = l2
            l2 = l2?.next
        }
        tail = tail?.next
    }
    tail?.next = l1 ?? l2
    return dummy.next
}



printList(n1)
printList(m1)

let merged = mergeLists(n1, m1)
printList(merged)
//: [Next](@next)
