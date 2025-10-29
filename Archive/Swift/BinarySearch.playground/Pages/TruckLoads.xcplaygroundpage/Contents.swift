//: [Previous](@previous)

import Foundation

let weigths = [1,2,3,4,5,6,7,8,9,10]
let d = 5
let truckLoad = 15

func findTruckLoad(_ weights: [Int], d: Int)->Int {
	let min = weigths.max() ?? 0
	let max = weigths.reduce(0, +)
	var idealTruckLoad = -1
	
	func binarySearch(_ array:[Int], low: Int, high: Int) {
		if low > high {
			return
		}
		let mid = (low + high) / 2
		if canBeLoad(weigths: weights,
					 d: d,
					 truckLoad:array[mid]) {
			idealTruckLoad = array[mid]
			binarySearch(array, low: low, high: mid - 1)
			
		} else {
			binarySearch(array, low: mid + 1, high: high)
		}
	}
	
	let possibleTruckLoads = Array(min...max)
	binarySearch(possibleTruckLoads, low: 0, high:possibleTruckLoads.count - 1)
	return idealTruckLoad
}



func canBeLoad(weigths: [Int], d: Int, truckLoad:Int) -> Bool {
	var time = 1
	var load = 0
	for w in weigths {
		if (load + w) <= truckLoad {
			load += w
		} else {
			time += 1
			load = w
		}
		if time > d {
			return false
		}
	}
	print("days:\(time)")
	return true
}

canBeLoad(weigths: weigths, d: d, truckLoad:truckLoad)
findTruckLoad(weigths, d: d)
//: [Next](@next)
