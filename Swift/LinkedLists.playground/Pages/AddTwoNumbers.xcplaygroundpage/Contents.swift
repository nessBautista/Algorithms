//: [Previous](@previous)

import Foundation

func buildList1() -> ListNode {
	let node1 = ListNode(2)
	let node2 = ListNode(4)
	let node3 = ListNode(9)
	node1.next = node2
	node2.next = node3
	
	return node1
}

func buildList2() -> ListNode {
	let node1 = ListNode(5)
	let node2 = ListNode(6)
	let node3 = ListNode(4)
	let node4 = ListNode(9)
	
	node1.next = node2
	node2.next = node3
	node3.next = node4
	return node1
}


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
	var output: ListNode? = nil
	var curr: ListNode? = nil
	var counter = 0
	
	traverse(l1, l2)
	
	if counter > 0 {
		add(0, 0)
	}
	
	func traverse(_ n1:ListNode?, _ n2: ListNode?){
		if n1 == nil && n2 == nil {
			return
		}
		add(n1?.val ?? 0, n2?.val ?? 0)
		traverse(n1?.next, n2?.next)
	}
	
	func add(_ x: Int, _ y:Int){
		var sum = x + y + counter
		counter = 0
		if sum >= 10 {
			counter = 1
			sum = sum % 10
		}
		if output == nil {
			output = ListNode(sum)
			curr = output
		} else {
			curr?.next = ListNode(sum)
			curr = curr?.next
		}
	}
	return output
}

let l1 = buildList1()
let l2 = buildList2()
ListNode.printList(l1)
ListNode.printList(l2)


let sum = addTwoNumbers(l1, l2)
ListNode.printList(sum)

//: [Next](@next)
