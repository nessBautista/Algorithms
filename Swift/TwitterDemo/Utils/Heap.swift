//
//  Heap.swift
//  TwitterDemo
//
//  Created by Nestor Hernandez on 23/06/22.
//

import Foundation

public struct Heap<Element>{
	public var elements:[Element]
	let priorityFunction: (Element, Element) -> Bool
	
	public init(_ elements:[Element], _ priorityFunction: @escaping (Element, Element) -> Bool) {
		self.elements = elements
		self.priorityFunction = priorityFunction
		self.buildHeap()
	}
	public mutating func buildHeap(){
		for idx in (0..<count/2).reversed(){
			siftDown(elementAtIndex: idx)
		}
	}
	
	public var isEmpty: Bool {
		return elements.isEmpty
	}
	
	public var count: Int {
		return elements.count
	}
	
	public func peek()->Element? {
		return elements.first
	}
	
	public func isRoot(_ index: Int) -> Bool {
		return index == 0
	}
	
	public func leftChildIndex(of index:Int)->Int{
		(2 * index) + 1
	}
	
	public func rightChildIndex(of index:Int)->Int{
		(2 * index) + 2
	}
	
	public func parentIndex(of index: Int) -> Int {
		(index - 1) / 2
	}
	
	// uses priority function
	public func isHigherPriority(at firstIndex: Int, than secondIndex: Int)-> Bool {
		
		priorityFunction(elements[firstIndex], elements[secondIndex])
	}
	
	// Determines higher priority between parent and child
	public func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int{
		guard childIndex < count &&
				isHigherPriority(at: childIndex,
								 than: parentIndex) else {
					return parentIndex
				}
		return childIndex
	}
	
	// Determines higher priority between 3 nodes: parent and its two children
	public func highestPriorityIndex(for parent:Int) -> Int{
		highestPriorityIndex(of: highestPriorityIndex(of: parent,
													  and: leftChildIndex(of: parent)),
							 and: rightChildIndex(of: parent))
	}
	
	public mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
		guard firstIndex != secondIndex else {return}
		elements.swapAt(firstIndex, secondIndex)
	}
	
	public mutating func siftUp(elementAtIndex index: Int){
		let parent = parentIndex(of: index)
		guard !isRoot(index), isHigherPriority(at: index, than: parent) else {return}
		swapElement(at: parent, with: index)
		siftUp(elementAtIndex: parent)
	}
	
	public mutating func siftDown(elementAtIndex index: Int){
		let childIndex =  highestPriorityIndex(for: index)
		if childIndex == index {
			return
		}
		swapElement(at: index, with: childIndex)
		siftDown(elementAtIndex: childIndex)
	}
	
	public mutating func enqueue(_ element: Element){
		elements.append(element)
		siftUp(elementAtIndex: elements.count - 1)
	}
	
	// dequeues the highest priority (root)
	public mutating func dequeue() -> Element?{
		guard !isEmpty else {return nil}
		swapElement(at: 0, with: count - 1)
		let element = elements.removeLast()
		if !isEmpty{
			siftDown(elementAtIndex: 0)
		}
		return element
	}
}

