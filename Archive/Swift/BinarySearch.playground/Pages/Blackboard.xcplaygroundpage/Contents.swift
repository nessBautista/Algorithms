import Foundation
class TimeMap {
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
				binSearch(low: low, high: mid - 1)
			} else if target > array[mid].time {
 				binSearch(low: mid + 1, high: high)
			}
		}
		
		binSearch(low: 0, high: array.count - 1)
		return output
	}
}
