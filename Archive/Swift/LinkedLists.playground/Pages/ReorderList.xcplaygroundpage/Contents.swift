//: [Previous](@previous)

import Foundation

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() {
		 self.val = 0; self.next = nil
	 }
     public init(_ val: Int) {
		 self.val = val; self.next = nil
	 }
	
	public init(_ val: Int, _ next: ListNode?) {
		self.val = val; self.next = next
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

func buildListExample() -> ListNode {
	let node1 = ListNode(1)
	let node2 = ListNode(2)
	let node3 = ListNode(3)
	let node4 = ListNode(4)
	let node5 = ListNode(5)
	let node6 = ListNode(6)
	let node7 = ListNode(7)
	node1.next = node2
	node2.next = node3
	node3.next = node4
	node4.next = node5
	node5.next = node6
	node6.next = node7
	return node1
}

func reorderList(_ head: ListNode?) {
	var counter: Double = 0
	var max:Double = 0
	var mid:Double = 0
	var midNode:ListNode? = nil
	
	traverse(head)
	ListNode.printList(head!)
	let midInversed = reverseList(midNode)
	ListNode.printList(midInversed!)
	
	func traverse(_ node:ListNode?){
		guard node != nil else {
			max = counter
			mid = (counter / 2.0).rounded(.up)
			print(mid)
			return
		}
		counter += 1
		traverse(node?.next)
		counter -= 1
		if counter == mid {
			midNode = node
		} else if counter == (mid - 1){
			node?.next = nil
		}
	}
	
	func reverseList(_ head: ListNode?) -> ListNode? {
		var curr: ListNode? = head
		var past: ListNode? = nil
		var next: ListNode? = nil
		while curr != nil {
			next = curr?.next
			curr?.next = past
			past = curr
			curr = next
		}
		curr = past
		return curr
	}
}


let head = buildListExample()
ListNode.printList(head)

reorderList(head)

print("Done")

//: [Next](@next)
