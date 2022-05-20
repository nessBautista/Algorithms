//: [Previous](@previous)

import Foundation
public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init(_ val: Int) {
		self.val = val
		self.next = nil
	}
	static func printList(_ node: ListNode){
		var it: ListNode? = node
		var output = String()
		while it != nil {
			output.append("\(it!.val)->")
			it = it?.next
		}
		print(output)
	}
}
func buildList1() -> ListNode {
	let node3 = ListNode(3)
	let node2 = ListNode(2)
	let node0 = ListNode(0)
	let node4 = ListNode(4)
	
	
	node3.next = node2
	node2.next = node0
	node0.next = node4
	node4.next = node2
	return node3
}
extension ListNode:Hashable {
	public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
		ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(ObjectIdentifier(self).hashValue)
	}
}
// Solution 1: Using Hash tables
/*

func hasCycle(_ head: ListNode?) -> Bool {
	guard head != nil else {return false}
	var register:[ListNode: Int] = [:]
	var it:ListNode? = head
	
	repeat{
		if register[it!] == nil {
			register[it!] = 1
		} else {
			return true
		}
		it = it?.next
	} while it != nil
	
	return false
}
*/
func hasCycle(_ head: ListNode?) -> Bool {
	guard head != nil else {return false}
	
	var slow:ListNode? = head
	var fast:ListNode? = head
	
	while fast != nil {
		slow = slow?.next
		fast = fast?.next?.next
		if let s = slow, let f = fast {
			if s == f {return true}
		}
	}
	
	return false
}


let head = buildList1()
print(hasCycle(head))


//: [Next](@next)
