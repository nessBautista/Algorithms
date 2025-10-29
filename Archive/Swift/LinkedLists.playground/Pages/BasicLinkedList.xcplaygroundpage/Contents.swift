//: [Previous](@previous)

import XCTest
class LinkedListTest: XCTestCase {
	var sut: LinkedList<Int>!
	
	override func setUp() {
		super.setUp()
		self.sut = LinkedList<Int>()
	}
	
	override func tearDown() {
		self.sut = nil
		super.tearDown()
	}
	
	func test_linkedList_init(){
		let list = LinkedList<Int>()
		XCTAssertNotNil(list)
		XCTAssertNil(list.head)
		XCTAssertNil(list.tail)
	}
	
	func test_IntList_insertAtFront(){
		//when
		sut.insertAtFront(10)
		// then
		XCTAssertEqual(sut.head!.val, 10)
		XCTAssertEqual(sut.tail!.val, 10)
	}
	
	func test_IntList_insertAtFront_twoItems(){
		//when
		sut.insertAtFront(10)
		sut.insertAtFront(11)
		sut.insertAtFront(13)
		// then
		XCTAssertEqual(sut.head!.val, 13)
		XCTAssertEqual(sut.tail!.val, 10)
		XCTAssertEqual(sut.length(), 3)
	}
	
	func test_IntList_insertAtBack(){
		//when
		sut.insertAtBack(1)
		sut.insertAtBack(2)
		
		// then
		XCTAssertEqual(sut.head!.val, 1)
		XCTAssertEqual(sut.tail!.val, 2)
	}
	
	func test_content(){
		let expectedOuput = "10->9->2->1->"
		// when
		sut.insertAtBack(2)
		sut.insertAtBack(1)
		sut.insertAtFront(9)
		sut.insertAtFront(10)
		// then
		print(sut.getContent())
		XCTAssertEqual(expectedOuput, sut.getContent())
	}
	
	func test_reverseList(){
		let expectedOuput = "5->4->3->2->1->"
		// when
		sut.insertAtFront(5)
		sut.insertAtFront(4)
		sut.insertAtFront(3)
		sut.insertAtFront(2)
		sut.insertAtFront(1)
		sut.reverseList()
		
		// then
		print(sut.getContent())
		XCTAssertEqual(expectedOuput, sut.getContent())
	}
	
}


LinkedListTest.defaultTestSuite.run()
//: [Next](@next)
