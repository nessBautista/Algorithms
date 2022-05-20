//: [Previous](@previous)

import Foundation
var a1 = [5, 1, 4, 2]
var a2 = [7, 1, 2]

// The big O notation for a bubble sort establishes that
/*
 In the best scenario when array is sorted, time is: O(N)
 In the worst scenario, when sorted backwards: O(N)O(N-1) = O(N^2 - N) = O(N^2)
 */
func bubbleSort(_ array:inout [Int]) {
	let N = array.count
	for _ in 0..<N {
		//Bubble Up the highest Value
		for j in 1..<N {
			if array[j-1]>array[j]{
				array.swapAt(j-1, j)
			}
		}
	}
}
bubbleSort(&a1)
print(a1)
//: [Next](@next)
