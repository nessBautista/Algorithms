//: [Previous](@previous)

import Foundation

func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
	
	func binaryPartition(low:Int, high:Int){
		guard low <= high else {return}
		let mid = Int(Double((low + high) / 2).rounded(.down))
		let time = sumTime(Double(mid), Double(h), piles: piles)
		print(mid,time)
		if time > h {
			binaryPartition(low:mid + 1, high:high)
		} else if time <= h {
			setOutput(mid)
			binaryPartition(low:low, high:mid - 1)
		}
	}
	func sumTime(_ k:Double, _ h: Double, piles: [Int])-> Int {
		let time = piles.reduce(0) { result, pile in
			var timePerPile = (Double(pile) / k)
			timePerPile.round(.up)
			return (result + Int(timePerPile))
			 
		}
		return time
	}
	func setOutput(_ n: Int){
		if output == nil {
			output = n
		} else {
			output = n < output! ? n : output!
		}
	}
	
	var output:Int? = nil
	var max = 0

	for pile in piles {
		max = pile > max ? pile : max
	}
	
	binaryPartition(low: 1, high: max)
	
	return output ?? 2
}
//sumTime(24, 6, piles: [30,11,23,4,20])
minEatingSpeed([30,11,23,4,20], 6)

func minEatingSpeed2(_ piles: [Int], _ h: Int) -> Int {
	var output = 0
	let max = piles.max() ?? 0
	let min =  1 // should at least eat one
	binSearch(low: min, high: max)
	
	func binSearch(low: Int, high: Int) {
		if low > high {
			return
		}
		let mid = (low + high) / 2
		if verifyK(mid) {
			output = mid
			binSearch(low: low, high: mid - 1)
		} else {
			binSearch(low: mid + 1, high: high)
		}
	}
	
	func verifyK(_ k: Int) -> Bool {
		let time = piles.reduce(0, { (total, pile) in
			let t = (Double(pile) / Double(k)).rounded(.up)
			return total + Int(t)
		})
		return time <= h
	}
	return output
}
//: [Next](@next)
