//: [Previous](@previous)

import Foundation
struct PointInfo: Equatable, Comparable {
	static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.distance == rhs.distance
	}
	
	static func > (lhs: Self, rhs: Self) -> Bool {
		lhs.distance > rhs.distance
	}
	static func < (lhs: Self, rhs: Self) -> Bool {
		lhs.distance < rhs.distance
	}
	
	var coordinates:[Int]
	var distance: Double
	
	init(_ coordinates: [Int]){
		self.coordinates = coordinates
		self.distance = pow(Double(coordinates[0]), 2) + pow(Double(coordinates[1]), 2)
	}
}

func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
	var output:[[Int]] = []
	let pointInfo = points.map({PointInfo($0)})
	var minHeap = Heap(elements: pointInfo, priorityFunction: <)
	
	for _ in 0..<k{
		if let min = minHeap.dequeue() {
			output.append(min.coordinates)
		}
	}
	
	return output
}
print("Done")

//: [Next](@next)
