//: [Previous](@previous)

import Foundation

func buildLists(_ a:[Int], _ b:[Int])->(ListNode, ListNode) {
			
	func createList(_ a:[Int])-> ListNode {
		var dummy1:ListNode = ListNode(0)
		
		var it: ListNode? = dummy1
		for item in a {
			let newNode = ListNode(item)
			it?.next = newNode
			it = it?.next
		}
		return dummy1.next!
	}
	
	return (createList(a), createList(b))
}

let list1 = [1,2,4]
let list2 = [1,3,4]
let lists = buildLists(list1, list2)
let l1 = lists.0
let l2 = lists.1
ListNode.printList(l1)
ListNode.printList(l2)


func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
	guard list1 != nil else {
		if list2 != nil {return list2}
		return nil
	}
	guard list2 != nil else {
		if list1 != nil {return list1}
		return nil
	}
	var dummy = ListNode(0)
	
	var it:ListNode? = dummy
	var it1:ListNode? = list1
	var it2:ListNode? = list2
	while it1 != nil && it2 != nil {
		if it1!.val <= it2!.val {
			it?.next = it1
			it = it?.next
			it1 = it1?.next
		} else {
			it?.next = it2
			it = it?.next
			it2 = it2?.next
		}
	}
	if it1 != nil {
		it?.next = it1
	}
	if it2 != nil {
		it?.next = it2
	}
	
	return dummy.next
}
let mergedList = mergeTwoLists(l1, l2)
ListNode.printList(mergedList)
//: [Next](@next)
