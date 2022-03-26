//
//  CoordinateTests.swift
//  PathMarkerTests
//
//  Created by Nestor Hernandez on 10/03/22.
//

import XCTest
@testable import PathMarker

class CoordinateTests: XCTestCase {

	var sut: Coordinates!
	
    override func setUpWithError() throws {
		try? super.setUpWithError()
		sut = Coordinates(x: 1, y: 1)
    }

    override func tearDownWithError() throws {
		sut = nil
		try? super.tearDownWithError()
    }

	func test_add_Coordinates(){
		// given
		let givenCoordinates = Coordinates(x: 1, y: 1)
		// when
		let result = givenCoordinates + sut
		//Then
		XCTAssertEqual(result.x, 2)
		XCTAssertEqual(result.y, 2)
	}
	
	func test_negativeCoordinates_isOutOfBounds(){
		var givenCoordinates = Coordinates(x: -1, y: 0)
		XCTAssertTrue(givenCoordinates.isOutOfBounds())
		givenCoordinates = Coordinates(x: 0, y: -1)
		XCTAssertTrue(givenCoordinates.isOutOfBounds())
		givenCoordinates = Coordinates(x: -1, y: -1)
		XCTAssertTrue(givenCoordinates.isOutOfBounds())
	}
    
}
