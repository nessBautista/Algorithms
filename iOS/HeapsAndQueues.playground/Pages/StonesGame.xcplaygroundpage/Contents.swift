//: [Previous](@previous)

import Foundation

struct Heap<Element>{
	var elements:[Element]
	let priorityFunction: (Element, Element) -> Bool
	
	init(elements:[Element], priorityFunction: @escaping (Element, Element) -> Bool) {
		self.elements = elements
		self.priorityFunction = priorityFunction
		self.buildHeap()
	}
	mutating func buildHeap(){
		for idx in (0..<count/2).reversed(){
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

func lastStoneWeight(_ stones: [Int]) -> Int {
	var maxHeap = Heap(elements: stones, priorityFunction: >)
	while maxHeap.count > 1 {
		if let first = maxHeap.dequeue(),
		   let second = maxHeap.dequeue() {
			if first != second {
				if first > second {
					maxHeap.enqueue(first - second)
				} else {
					maxHeap.enqueue(second - first)
				}
			}
		}
	}
	
	return maxHeap.peek() ?? 0
		
}
print("Done")



//: [Next](@next)
