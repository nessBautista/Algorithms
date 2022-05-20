//
//  PathItemTest.swift
//  PathMarkerTests
//
//  Created by Nestor Hernandez on 11/03/22.
//

import XCTest
@testable import PathMarker
class PathItemTest: XCTestCase {

	var sut: PathItem!
    override func setUpWithError() throws {
		try! super.setUpWithError()
		sut = PathItem(value: 0, coordinates: Coordinates(x: 0, y: 0))
    }

    override func tearDownWithError() throws {
		sut = nil
        try! tearDownWithError()
    }

//	func test_conformsToHashable(){
//		XCTAssertTrue((sut as Any) is Hashable)
//	}

}
