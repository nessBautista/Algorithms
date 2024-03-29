//: [Previous](@previous)

import Foundation

class TimeMap {
	var register:[String:[(val:String, time:Int)]] = [:]

	init() {
		
	}
	
	func set(_ key: String, _ value: String, _ timestamp: Int) {
		if register[key] == nil {
			register[key] = [(value, timestamp)]
		} else {
			register[key]!.append((value, timestamp))
		}
	}
	
	func get(_ key: String, _ timestamp: Int) -> String {
		var result: String? = nil
		//look array exist in register
		guard register[key] != nil else {return String()}
		
		//look for last value
		if let last = register[key]!.last, timestamp >= last.time {
			return last.val
		}
		binarySearch(target: timestamp, low: 0, high:register[key]!.count - 1)
		func binarySearch(target: Int, low: Int, high:Int){
			guard result == nil else {return}
			print("---")
			guard low <= high else {return}
			let mid = Int(ceil(Double(low + high)/2.0))
			print("mid:\(mid)")
			//search left
			if (mid - 1) >= 0  {
				let range = (register[key]![mid-1].time)...((register[key]![mid].time))
				if range.contains(target) {
					result = register[key]![mid-1].val
				}
			}
			//search right
			if (mid + 1) < register[key]!.count {
				let range = (register[key]![mid].time)...((register[key]![mid + 1].time))
				if range.contains(target) {
					result = register[key]![mid].val
				}
			}
			 
			//continue searching
			binarySearch(target:target, low:low, high:mid - 1)
			binarySearch(target:target, low:mid + 1, high: high)
		}
		
		return result ?? String()
	}
}

let timeMap = TimeMap()
timeMap.set("love","high",10)
timeMap.set("love","low",20)
timeMap.get("love", 5)
timeMap.get("love", 10)
timeMap.get("love", 15)
timeMap.get("love", 20)
timeMap.get("love", 25)

//-- This also works
class TimeMap2 {
	var dict:[String:[(time:Int, val:String)]] = [:]
	init() {
		
	}
	
	func set(_ key: String, _ value: String, _ timestamp: Int) {
		if dict[key] == nil {
			dict[key] = [(timestamp, value)]
		} else {
			dict[key]?.append((timestamp, value))
		}
	}
	
	func get(_ key: String, _ timestamp: Int) -> String {
		if let array = dict[key] {
			return getValue(array, timestamp)
		}
		return String()
	}
	
	func getValue(_ array: [(time:Int, val:String)], _ target: Int) -> String {
		guard !array.isEmpty else {return String()}
		if target >= array.last!.time {
			return array.last!.val
		}
		var output = String()
		
		func binSearch(low: Int, high: Int){
			if low > high {
				return
			}
			let mid = (low + high) / 2
		
			if array[mid].time <= target {
				output = array[mid].val
				//binSearch(low: low, high: mid - 1)
			} else if target > array[mid].time {
				binSearch(low: mid + 1, high: high)
			}
		}
		
		binSearch(low: 0, high: array.count - 1)
		return output
	}
}
//: [Next](@next)

