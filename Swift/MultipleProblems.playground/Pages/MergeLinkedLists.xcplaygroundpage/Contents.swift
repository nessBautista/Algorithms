import UIKit

var greeting = "Hello, playground"
extension Node: Equatable where Element:Strideable {
	public static func == (lhs: Node<Element>, rhs: Node<Element>) -> Bool {
		lhs.val == lhs.val
	}
	
}

extension Node: Comparable where Element:Strideable {
	public static func < (lhs: Node<Element>, rhs: Node<Element>) -> Bool {
		lhs.val < rhs.val
	}
	public static func > (lhs: Node<Element>, rhs: Node<Element>) -> Bool {
		lhs.val > rhs.val
	}
}

let list1 = LinkedList<Int>()
list1.insertAtBack(4)
list1.insertAtBack(8)
list1.insertAtBack(15)
list1.insertAtBack(19)
list1.getContent()

let list2 = LinkedList<Int>()
list2.insertAtBack(7)
list2.insertAtBack(9)
list2.insertAtBack(10)
list2.insertAtBack(16)
list2.getContent()

func switchTrail<Element:Strideable>(from current: Node<Element>,
						  to new:Node<Element>) -> Node<Element>?{
	let next = current.next
	current.next = new
	return next
}

func mergeSorted<Element:Strideable>(_ h1:Node<Element>, _ h2: Node<Element>) -> Node<Element>? {
	
	// Determine which node has the smallest value
	var mainTrail:Node<Element>? = min(h1, h2)
	var nextTrail:Node<Element>? = max(h1, h2)
	
	// iterate
	while mainTrail?.next != nil && nextTrail != nil {
		// Find condition where you need cut and paste
		if (mainTrail?.next)! > nextTrail! {
			print("mainTrail?.val")
			let temp = mainTrail?.next
			mainTrail?.next = nextTrail
			nextTrail = temp
		}
		mainTrail = mainTrail?.next
	}
	// Check for residual
	if nextTrail != nil {
		mainTrail?.next = nextTrail
	}
	return min(h1,h2)
}





let head = mergeSorted(list1.head!, list2.head!)
var iter = head
while iter != nil {
	print(iter!.val)
	iter = iter?.next
}

list1.getContent()
