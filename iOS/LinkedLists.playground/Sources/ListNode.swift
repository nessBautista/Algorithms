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
	static public func printList(_ node: ListNode?){
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
