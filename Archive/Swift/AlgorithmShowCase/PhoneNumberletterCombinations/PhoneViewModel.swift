//
//  PhoneViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 08/06/22.
//

import Foundation
import Combine
class PhoneViewModel: ObservableObject {
	var data: [String]
	let phonePermutations = PhonePermutations()
	@Published var dialedNumbers:String = String()
	@Published var permutations:String = String()
	var subscriptions = Set<AnyCancellable>()
	
	init(){
		self.data = (1...9).map({"\($0)"})
		self.data.append("0")
		$dialedNumbers
			.sink { value in
				self.computeCombinations(value)
			}
			.store(in: &subscriptions)
	}
	
	func didTapOnNumber(_ number: String){
		self.dialedNumbers += number
	}
	
	func computeCombinations(_ number: String){
		let permutations = self.phonePermutations
							.getPermutations(number)
							.reduce(String()) { partialResult, value in
								return partialResult + "-" + value
							}
		self.permutations = permutations
	}
}
