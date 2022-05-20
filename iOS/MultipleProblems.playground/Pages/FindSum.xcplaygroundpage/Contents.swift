//: [Previous](@previous)

import Foundation

// Given an array and a value
// Determine if there are two integers in the array  whose sum equals
// the given value

let array = [5,7,2,1,8,4,3]
let target = 19
func sumExist(_ array:[Int], _ target: Int)-> Bool {
	var registry:[Int: Bool] = [:]
	
	// Loop
	for n in array{
		let requiredValue = target - n
		// does exist?
		if registry[requiredValue] != nil {
			return true
		}
		registry[n] = true
	}
	return false
}

sumExist(array, target)


//: [Next](@next)
