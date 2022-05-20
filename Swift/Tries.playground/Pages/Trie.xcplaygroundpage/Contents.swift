//: [Previous](@previous)

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
}

import XCTest

class TrieTests: XCTestCase {
	var sut: Trie!
	
	override func setUp() {
		sut = Trie()
	}
	
	override func tearDown() {
		sut = nil
	}
	
	func testInit(){
		XCTAssertNotNil(sut)
	}
	
	func testInsert(){
		//given
		let word = "apple"
		//when
		sut.insert(word)
		//then
		let isWordInTrie = sut.search(word)
		XCTAssertTrue(isWordInTrie)
	}
	
	func testSearch(){
		//given
		let word = "apple"
		let word2 = "app"
		let word3 = "apples"
		//when
		sut.insert(word)
		//then
		XCTAssertTrue(sut.search(word))
		XCTAssertFalse(sut.search(word2))
		XCTAssertFalse(sut.search(word3))
		
	}
	
	func testStartsWith(){
		//given
		let word1 = "app"
		let word2 = "apples"
		let word3 = "apple"
		//when
		sut.insert("apple")
		//then
		XCTAssertTrue(sut.startsWith(word1))
		XCTAssertFalse(sut.startsWith(word2))
		XCTAssertTrue(sut.startsWith(word3))
		
	}
}
TrieTests.defaultTestSuite.run()
//: [Next](@next)
