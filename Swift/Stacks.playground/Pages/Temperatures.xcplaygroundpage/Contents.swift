//: [Previous](@previous)

import Foundation
//https://leetcode.com/problems/daily-temperatures/
/*
 Given an array of integers temperatures represents the daily temperatures,
 return an array answer such that answer[i] is the number of days you have to wait
 after the ith day to get a warmer temperature.
 If there is no future day for which this is possible,
 keep answer[i] == 0 instead.
 */
// BruteForce: N^2
func dailyTemperatures_brute(_ temperatures: [Int]) -> [Int] {
	var stack: [Int] = []
	
	var out:[Int] = Array(repeating: 0, count: temperatures.count)
	var o = 0
	var i = 1
	while o < out.count {
		guard i < out.count else {break}
		stack.append(temperatures[i])
		if temperatures[i] > temperatures[o] {
						
			out[o] = stack.count
			o += 1
			i = o + 1
			stack = []
		} else {
			i += 1
			if i == out.count {
				o += 1
				i = o + 1
				stack = []
			}
		}
	}
	print(out)
	return out
	
}

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
	var stack: [(idx:Int, val:Int)] = []
	var out:[Int] = Array(repeating: 0, count: temperatures.count)
	
	for (idx, temp) in temperatures.enumerated() {
		if stack.isEmpty {
			stack.append((idx, temp))
		}
		
		if temp > (stack.last?.val ?? 0) {
			while !stack.isEmpty {
				guard let last = stack.last,
					  temp > last.val else {
					break
				}
				let lastTemperature = stack.popLast()!
				out[lastTemperature.idx] = idx - lastTemperature.idx
			}
			// either the stack is empty or temperature < last Temperature
			stack.append((idx, temp))
		} else {
			stack.append((idx, temp))
		}
	}
	
	return out
}










let temperatures = [73,74,75,71,69,72,76,73]
let result = dailyTemperatures(temperatures)
result
//: [Next](@next)
