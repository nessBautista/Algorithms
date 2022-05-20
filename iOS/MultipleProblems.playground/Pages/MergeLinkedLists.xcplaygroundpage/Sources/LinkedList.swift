import Foundation

public class Node<Element> {
	public var val: Element
	public var next: Node? = nil
	public init(val: Element){
		self.val = val
	}
}
public class LinkedList<Element> {
	public var head: Node<Element>? = nil
	public var tail: Node<Element>? = nil
	public init(){
		
	}
	
	public func insertAtFront(_ val: Element) {
		let newNode = Node(val:val)
		guard self.length() != 0 else {
			self.head = newNode
			self.tail = newNode
			return
		}
		
		newNode.next = head
		head = newNode
	}
	
	public func insertAtBack(_ val: Element) {
		let newNode = Node(val:val)
		guard self.length() != 0 else {
			self.head = newNode
			self.tail = newNode
			return
		}
		self.tail?.next = newNode
		self.tail = newNode
	}
	
	public func getContent()->String {
		var output = String()
		guard self.length() != 0 else {
			return output
		}
		var iter:Node<Element>? = head
		while iter != nil {
			output += "\(iter!.val)->"
			iter = iter?.next
		}
		
		return output
	}
	
	public func reverseList(){
		guard self.length() != 0 else {
			return
		}
		var temp: Node<Element>? = head
		head = tail
		tail = temp
		
		var past: Node<Element>? = nil
		var curr: Node<Element>? = tail
		temp = nil
		
		while curr != nil {
			temp = curr?.next
			curr?.next = past
			past = curr
			curr = temp
		}
		curr?.next = past
	}
	
}
extension LinkedList {
	public func length()-> Int{
		guard (head != nil) && (tail != nil) else {
			return 0
		}
		var count = 1
		var iter:Node<Element>? = self.head
		
		while iter?.next != nil {
			count += 1
			iter = iter?.next
		}
		return count
	}
}


