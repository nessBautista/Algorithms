//: [Previous](@previous)

import Foundation
import Darwin

func buildLists(_ lists:[[Int]])->[ListNode?] {
	var output:[ListNode?] = []
	for l in lists {
		let list = createList(l)
		output.append(list)
	}
	func createList(_ a:[Int])-> ListNode {
		let dummy1:ListNode = ListNode(0)
		var it: ListNode? = dummy1
		for item in a {
			let newNode = ListNode(item)
			it?.next = newNode
			it = it?.next
		}
		return dummy1.next!
	}
	return output
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
	guard lists.count > 0 else  {return nil}
	var ls = lists
	while ls.count > 1 {
		var mergedLists:[ListNode?] = []
		for i in stride(from:0, to: ls.count, by: 2){
			let l1 = ls[i]
			let l2 = (i+1)<ls.count ? ls[i+1] : nil
			let ml = mergeLists(l1, l2)
			mergedLists.append(ml)
		}
		ls = mergedLists
	}
	
	func mergeLists(_ l1: ListNode?, _ l2:ListNode?) -> ListNode? {
		guard l1 != nil else {
			if l2 != nil {return l2}
			return nil
		}
		guard l2 != nil else {
			if l1 != nil {return l1}
			return nil
		}
		let dummy = ListNode(0)
		var it1:ListNode? = l1
		var it2:ListNode? = l2
		var it:ListNode? = dummy //dummy head
		
		while it1 != nil && it2 != nil {
			if it1!.val <= it2!.val {
				it?.next = it1
				it1 = it1?.next
			} else {
				it?.next = it2
				it2 = it2?.next
			}
			it = it?.next
		}
		if it1 != nil {
			it?.next = it1
		}
		if it2 != nil {
			it?.next = it2
		}
		return dummy.next
	}
	
	return ls[0]
}

let lists = buildLists([[1,4,5],[1,3,4],[2,6]])
lists.forEach({ListNode.printList($0)})
let mergedLists = mergeKLists(lists)
ListNode.printList(mergedLists)
//: [Next](@next)
