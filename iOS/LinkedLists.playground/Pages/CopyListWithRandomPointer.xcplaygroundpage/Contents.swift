//: [Previous](@previous)

import Foundation

public class Node {
	public var val: Int
	public var next: Node?
	public var random: Node?
	
	public init(_ val: Int) {
		self.val = val
		self.next = nil
		self.random = nil
	}
	static public func printList(_ node: Node?){
		guard node != nil else{return}
		var it: Node? = node
		var output = String()
		while it != nil {
			output.append("\(it!.val)-(\(it!.random?.val)->")
			it = it?.next
		}
		print(output)
	}
}


func copyRandomList(_ head: Node?) -> Node? {
	var output:Node? = nil
	guard head != nil else {return output}
	var register:[Int: Node?] = [:]
	
	var it:Node? = head
	var counter = 0
	while it != nil{
		register[counter] = it
		counter += 1
		it = it?.next
	}
	
	it = head
	counter = 0
	
	while it != nil{
		if let oNode = register[counter] {
			let newNode = Node(oNode!.val)
		}
		
		it = it?.next
	}
	
	
	return output
}
print("done")
//: [Next](@next)
