//: [Previous](@previous)

import Foundation
var a1 = [5, 1, 4, 2]
var a2 = [7, 1, 2]

var a3 = [2, 7, 12]
func bubbleSort(_ array: inout [Int]){
	var i = 0
	var j = 1
	let n = array.count
	var count = 0
	
	while (i < n && j < n) {
		if array[i] > array[j]{
			count += 1
			array.swapAt(i, j)
		}
		j += 1
		
		if j == n {
			i += 1
			j = i + 1
		}
	}
	print("swaps:\(count)")
}


bubbleSort(&a2)
print(a2)
bubbleSort(&a3)
print(a3)

//: [Next](@next)
