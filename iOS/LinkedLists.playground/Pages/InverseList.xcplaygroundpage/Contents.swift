import UIKit

public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init() {
		self.val = 0; self.next = nil;
	}
	public init(_ val: Int) {
		self.val = val; self.next = nil;
	}
	public init(_ val: Int, _ next: ListNode?) {
		self.val = val; self.next = next;
	}
	static func printList(_ node: ListNode?){
		guard node != nil else{return}
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
	node1.next = node2
	node2.next = node3
	node3.next = node4
	node4.next = node5
	return node1
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
let head = buildListExample()
ListNode.printList(head)

let reversedHead = reverseList(head)
ListNode.printList(reversedHead)
