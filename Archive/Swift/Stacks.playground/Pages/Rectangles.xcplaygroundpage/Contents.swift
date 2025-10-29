//: [Previous](@previous)

import Foundation
//** Pending
//let input:[Int] = Array(0...10).map{ _ in .random(in: 1...10)}
let input = [2,1,5,6,2,3]
let input1 = [2,0,2]
class HistoData {
	var idx:Int
	var val: Int
	var limit:Int
	
	init(idx:Int, val:Int, limit:Int){
		self.idx = idx
		self.val = val
		self.limit = limit
	}
	
	func printMe(){
		print("idx:\(idx) - val: \(val) - limit: \(limit)")
	}
}
func largestRectangle(_ histogram: [Int ])->Int{
	var register:[HistoData] = []
	var area:Int = 0
	
	for (idx,item) in histogram.enumerated() {
		
		if isGreather(item: item) {
			// if greater, update the register with the area
			updateArea(item: item)
			// Before Adding, update the limits variables of the histo data
			updateLimits(item: item)
			// Register the new increasing item
			let data = HistoData(idx: idx, val: item, limit: 0)
			register.append(data)
			
			
			
		} else {
		// If is less or equal, we need iterate to get area
			var area = item
			getRectangle(area: &area, item: item)
			updateArea(item: area)
			let data = HistoData(idx: idx, val: item, limit: 0)
			register.append(data)
		}
	}
	
	func updateLimits(item: Int){
		for reg in register.reversed() {
			guard reg.val > 0 else {return}
			
			if (reg.val <= item) {
				reg.limit += 1
			}
		}
	}
	
	func getRectangle(area: inout Int, item: Int){
		print("calculating area for:\(item)")
		// Check current values in register
		for reg in register.reversed(){
			if reg.val >= item {
				area += item
			} else {
				break
			}
		}
		print("area: \(area)")
	}
	func isGreather(item: Int)->Bool {
		guard register.count > 0 else {
			return true
		}
		return item > (register.last?.val ?? 0)
	}
	
	func updateArea(item: Int) {
		area = item > area ? item: area
	}
	
	register.forEach({$0.printMe()})
	func areasFromRegister(){
		for reg in register {
			if reg.limit != 0 {
				let area = reg.val * (reg.limit + 1)
				updateArea(item: area)
			}
		}
	}
	
	areasFromRegister()
	return area
}

print(largestRectangle(input1))









// MARK: Supporting stuff
protocol Stack {
	associatedtype Element
	var count:Int { get }
	mutating func pop() -> Element?
	mutating func push(_ element: Element)
}

struct IntStack:Stack{
	var count:Int {
		values.count
	}
	private var values:[Int] = []
	mutating func pop() -> Int? {
		return values.popLast()
	}
	mutating func push(_ element: Int){
		values.append(element)
	}
}

struct MyStack<Item>: Stack {
	var count:Int {
		values.count
	}
	private var values:[Item] = []
	
	mutating func pop() -> Item? {
		return values.popLast()
	}
	mutating func push(_ element: Item){
		values.append(element)
	}
}


extension Array:Stack{
	mutating func pop() -> Element? {
		return self.popLast()
	}
	
	mutating func push(_ element: Element) {
		self.append(element)
	}
}
//: [Next](@next)
