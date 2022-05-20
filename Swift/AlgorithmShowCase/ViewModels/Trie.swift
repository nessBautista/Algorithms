//
//  Trie.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 18/05/22.
//

import Foundation
class TrieNode {
	var hashMap:[Character: TrieNode] = [:]
	var EOW:Bool = false
}
class Trie {
	let root: TrieNode
	init() {
		self.root = TrieNode()
	}

	func insert(_ word: String) {
		var node:TrieNode? = root
		for char in word {
			if node?.hashMap[char] == nil {
				node?.hashMap[char] = TrieNode()
				node = node?.hashMap[char]
			} else {
				node = node?.hashMap[char]
			}
		}
		node?.EOW = true
	}

	func search(_ word: String) -> Bool {
		var node:TrieNode? = root
		for char in word {
			if node?.hashMap[char] == nil {
				return false
			}
			node = node?.hashMap[char]
		}
		if let eow = node?.EOW{
			return eow
		}
		return false
	}

	func startsWith(_ prefix: String) -> Bool {
		var node:TrieNode? = root
		for char in prefix {
			if node?.hashMap[char] == nil {
				return false
			}
			node = node?.hashMap[char]
		}
		return true
	}
	
	func getSuggestions(_ prefix: String) -> [String]{
		guard prefix.isEmpty == false else {return []}
		var output:[String] = []
			
		traverse(root, currentWord: "")
		
		func traverse(_ node: TrieNode?, currentWord: String) {
			print(currentWord)
			guard node != nil  else {return}
			if node!.EOW {
				print("EOW detected:\(currentWord)")
				output.append(currentWord)
			}
			guard node!.hashMap.isEmpty == false else {return}
			for (key, value) in node!.hashMap {
				traverse(value, currentWord: currentWord + "\(key)")
			}
		}
		
		return output
	}
}
