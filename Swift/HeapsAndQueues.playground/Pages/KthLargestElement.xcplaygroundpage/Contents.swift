import UIKit

struct Heap<Element>{
	var elements:[Element]
	let priorityFunction: (Element, Element) -> Bool
	
	init(elements:[Element], priorityFunction: @escaping (Element, Element) -> Bool) {
		self.elements = elements
		self.priorityFunction = priorityFunction
		self.buildHeap()
	}
	mutating func buildHeap(){
		for idx in (0..<count/2).reversed() {
			siftDown(elementAtIndex: idx)
		}
	}
	
	var isEmpty: Bool {
		return elements.isEmpty
	}
	
	var count: Int {
		return elements.count
	}
	
	func peek()->Element? {
		return elements.first
	}
	
	func isRoot(_ index: Int) -> Bool {
		return index == 0
	}
	
	func leftChildIndex(of index:Int)->Int{
		(2 * index) + 1
	}
	
	func rightChildIndex(of index:Int)->Int{
		(2 * index) + 2
	}
	
	func parentIndex(of index: Int) -> Int {
		(index - 1) / 2
	}
	
	// uses priority function
	func isHigherPriority(at firstIndex: Int, than secondIndex: Int)-> Bool {
		
		priorityFunction(elements[firstIndex], elements[secondIndex])
	}
	
	// Determines higher priority between parent and child
	func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int{
		guard childIndex < count &&
				isHigherPriority(at: childIndex,
								 than: parentIndex) else {
			return parentIndex
		}
		return childIndex
	}
	
	// Determines higher priority between 3 nodes: parent and its two children
	func highestPriorityIndex(for parent:Int) -> Int{
		highestPriorityIndex(of: highestPriorityIndex(of: parent,
													  and: leftChildIndex(of: parent)),
							 and: rightChildIndex(of: parent))
	}
	
	mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
		guard firstIndex != secondIndex else {return}
		elements.swapAt(firstIndex, secondIndex)
	}
	
	mutating func siftUp(elementAtIndex index: Int){
		let parent = parentIndex(of: index)
		guard !isRoot(index), isHigherPriority(at: index, than: parent) else {return}
		swapElement(at: parent, with: index)
		siftUp(elementAtIndex: parent)
	}
	
	mutating func siftDown(elementAtIndex index: Int){
		let childIndex =  highestPriorityIndex(for: index)
		if childIndex == index {
			return
		}
		swapElement(at: index, with: childIndex)
		siftDown(elementAtIndex: childIndex)
	}
	
	mutating func enqueue(_ element: Element){
		elements.append(element)
		siftUp(elementAtIndex: elements.count - 1)
	}
	
	// dequeues the highest priority (root)
	mutating func dequeue() -> Element?{
		guard !isEmpty else {return nil}
		swapElement(at: 0, with: count - 1)
		let element = elements.removeLast()
		if !isEmpty{
			siftDown(elementAtIndex: 0)
		}
		return element
	}
}

class KthLargest {
	var minHeap: Heap<Int>
	var k:Int
	init(_ k: Int, _ nums: [Int]) {
		self.k = k
		self.minHeap = Heap(elements:nums, priorityFunction: <)
		while self.minHeap.count > k {
			self.minHeap.dequeue()
		}
	}
	
	func add(_ val: Int) -> Int {
		if self.minHeap.count < k {
			self.minHeap.enqueue(val)
		}
		else if let root = self.minHeap.peek(), val > root {
			self.minHeap.enqueue(val)
			self.minHeap.dequeue()
		}
		return self.minHeap.peek() ?? 0
	}
}
let kth = KthLargest(3, [4,5,8,2])
print(kth.minHeap.elements)
print(kth.add(3))
