//
//  MergeSortedArrayViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 21/06/22.
//

import Foundation
import Combine
class MergeSortedArrayViewModel: ObservableObject {
	@Published var data:[Int]
	let mergeSorter = MergeSorter()
	init(){
		let list = Set<Int>((0...100).map({_ in Int.random(in: 0...100)}))
		data = Array(list)
	}
	
	func applyMergeSort(){
		self.data = self.mergeSorter.mergeSort(data)
	}
}

class MergeSorter {
	func mergeSort(_ array: [Int])->[Int]{
		guard array.count > 1 else {return array}
		let mid = (array.count) / 2
		let left = mergeSort(Array(array[0..<mid]))
		let right = mergeSort(Array(array[(mid)..<(array.count)]))
		func mergeArray(_ a:[Int], _ b: [Int])->[Int]{
			var output:[Int] = []
			var i1 = 0
			var i2 = 0
			
			while i1 < a.count && i2 < b.count {
				//select less and continue
				if a[i1] < b[i2] {
					output.append(a[i1])
					i1 += 1
				} else {
					output.append(b[i2])
					i2 += 1
				}
			}
			// continue with the remaining
			while i1 != a.count {
				output.append(a[i1])
				i1 += 1
			}
			while i2 != b.count {
				output.append(b[i2])
				i2 += 1
			}
			return output
		}
		
		return mergeArray(left, right)
	}
	
}
