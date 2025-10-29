//: [Previous](@previous)

import Foundation
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
	let node5 = ListNode(5)
	return node5
}
func buildList2() -> ListNode {
	let node1 = ListNode(1)
	let node2 = ListNode(2)
	let node4 = ListNode(4)
	node1.next = node2
	node2.next = node4
	return node1
}



func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
	let dummy: ListNode? = ListNode()
	guard list1 != nil else {
		if list2 != nil {
			return list2
		}
		return nil
	}
	guard list2 != nil else {
		if list1 != nil {
			return list1
		}
		return nil
	}
	
	if list1! == nil && list2 == nil {
		return nil
	}
	var c1: ListNode? = list1
	var c2: ListNode? = list2
	var it: ListNode? = dummy
	
	while c1 != nil && c2 != nil {
		if c1!.val <= c2!.val {
			it?.next = c1
			it = it?.next
			c1 = c1?.next
		}
		else if c2!.val < c1!.val {
			it?.next = c2
			it = it?.next
			c2 = c2?.next
		}
	}
	it?.next = c1 != nil ? c1 : c2
	
	return dummy?.next
	
}

let list1 = buildList1()
ListNode.printList(list1)
let list2 = buildList2()
ListNode.printList(list2)
if let mergedList = mergeTwoLists(list1, list2){
	ListNode.printList(mergedList)
}

//: [Next](@next)
