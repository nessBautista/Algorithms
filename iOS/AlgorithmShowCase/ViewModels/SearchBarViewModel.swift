//
//  SearchBarViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 18/05/22.
//

import Foundation
import Combine

class SearchBarViewModel: ObservableObject {
	private(set) var subscriptions = Set<AnyCancellable>()
	@Published var query: String = String()
	@Published var autoCompletions: [String] = []
	let searchTrie = Trie()
	init(){
		$query
			.sink { query in
				self.updateSuggestions(query)
			}.store(in: &subscriptions)
		
		self.initializeTrie()
	}
	func updateSuggestions(_ query: String){
		self.autoCompletions = self.searchTrie.getSuggestions(query)
		print(query)
	}
	
	func getSuggestion(_ query: String)->String{
		if query.isEmpty {
			return "Empty"
		} else {
			return "Something"
		}
		
	}
	
	private func initializeTrie(){
		let initialDictionary = ["Apple", "App", "Ape", "Apples", "Coffe", "Milk", "Sandwich"]
		initialDictionary.forEach({self.searchTrie.insert($0)})
	}
}


