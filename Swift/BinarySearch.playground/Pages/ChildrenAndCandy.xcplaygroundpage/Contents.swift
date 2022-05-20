//: [Previous](@previous)

import Foundation


func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
	var output:Int? = nil
	var max = 1
	var min = Int.max
	var totalCandies = 0
	
	func binarySearch(_ low: Int, _ high: Int){
		guard low <= high else {return}
		let mid = (low + high) / 2
		let servedKids = servedKids(mid, piles: candies)
		print("candies:\(mid) servedKids:\(servedKids)")
		if servedKids >= k {
			setOutput(mid)
			binarySearch(mid + 1, high)
		} else {
			binarySearch(low, mid - 1)
		}
	}
	
	func setOutput(_ n: Int){
		if output == nil {
			output = n
		} else {
			output = n > output! ? n : output!
		}
	}
	func servedKids(_ candies:Int, piles: [Int])-> Int {
		let served = piles.reduce(0) { result, pile in
			return (result + (pile / candies))
		}
		return served
	}
	
	for candy in candies {
		max = candy > max ? candy : max
		min = candy < min ?  candy : min
		totalCandies += candy
	}
	guard totalCandies >= k else { return 0 }
	
	print("max: \(max)")
	binarySearch(1, max)
	
	return output ?? 0
}
let candies = [5,6,4,10,10,1,1,2,2,2]
let k = 9
maximumCandies(candies, k)

//func servedKids(_ candies:Int, piles: [Int])-> Int {
//	let served = piles.reduce(0) { result, pile in
//		print("--\(pile / candies)")
//		return (result + (pile / candies))
//	}
//	return served
//}
//servedKids(3, piles:  [5,6,4,10,10,1,1,2,2,2])
//: [Next](@next)
