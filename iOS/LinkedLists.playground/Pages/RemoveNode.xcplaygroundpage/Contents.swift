//: [Previous](@previous)

import Foundation

func buildList1() -> ListNode {
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
func buildList2() -> ListNode {
	let node1 = ListNode(1)
	return node1
}


func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
	var counter = 0
	var output:ListNode? = head
	var max: Int = 0
	var nodeToRemove:ListNode? = nil
	traverse(head)
	
	func traverse(_ node: ListNode?) {
		guard node != nil else {
			// Found the number of elements of the list
			max = counter
			if n > max {
				output = nil
			}
			if max == 1 && n <= max {
				output = nil
			}
			if max - n == 0 {
				print(max, counter)
				output = head?.next
			}
			return
		}
		counter += 1
		traverse(node?.next)
		counter -= 1
		if counter == (max - n) {
			nodeToRemove = node
		}
		if counter == (max - n) - 1 {
			node?.next = nodeToRemove?.next
		}
	}
	return output
}

let list1 = buildList1()
let list2 = buildList2()
ListNode.printList(list1)
let newList = removeNthFromEnd(list1, 4)
ListNode.printList(newList)
//: [Next](@next)
