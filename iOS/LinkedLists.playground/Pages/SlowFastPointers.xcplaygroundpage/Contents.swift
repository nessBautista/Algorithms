//: [Previous](@previous)

import Foundation

func buildList1() -> ListNode {
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

func getMiddleOfTheList(_ node: ListNode?){
	var counter = 0
	var slow: ListNode? = node
	var fast: ListNode? = node?.next
	while fast != nil {
		slow = slow?.next
		fast = fast?.next?.next
	}
	print("TheMiddleOfTheList is at: \(slow?.val)")
}
let list = buildList1()
ListNode.printList(list)
getMiddleOfTheList(list)
//: [Next](@next)
