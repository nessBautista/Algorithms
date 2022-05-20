//: [Previous](@previous)

import Foundation
import XCTest

class ArithmeticSeriesSum: XCTestCase{
	let sut = Series()
	
	func test_formula(){
		// Given
		let input = [1,2,3]
		// when
		let result = sut.sum(input.count)
		// then
		XCTAssertEqual(6, result)
	}
}

class Series {
	//Assuming starts in 1
	func sum(_ n:Int) -> Int {
		return Int((n/2)*(n+1))
	}
}
ArithmeticSeriesSum.defaultTestSuite.run()

// find missing number
let input = [3,7,1,2,8,4,5]

func findMissing(_ array:[Int])->Int {
	// Sum with missing element
	let arithSum = Series().sum(array.count + 1)
	// Summ without missing element
	let sum = array.reduce(0, ({$0 + $1}))
	// Missing element is the difference
	return arithSum - sum
}
findMissing(input)

//: [Next](@next)
