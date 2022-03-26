//
//  Coordinates.swift
//  PathMarker
//
//  Created by Nestor Hernandez on 11/03/22.
//

import Foundation

struct Coordinates: Equatable, Identifiable{
	var id: UUID = UUID()
	static func == (lhs: Coordinates, rhs: Coordinates) -> Bool {
		(lhs.x == rhs.x)&&(lhs.y == rhs.y)
	}
	var x: Int
	var y: Int
	
	func isOutOfBounds()-> Bool{
		return (self.x < 0 || self.y <  0) || (self.x >= 10 || self.y >= 10)
	}
	
	static func +(lhs: Coordinates, rhs: Coordinates) -> Coordinates {
		return Coordinates(
			x: lhs.x + rhs.x,
			y: lhs.y + rhs.y)
	}
}
extension Coordinates: Hashable {
	func hash(into hasher: inout Hasher) {
		hasher.combine(self.id)
	}
}

