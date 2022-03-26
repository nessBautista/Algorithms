//
//  Models.swift
//  PathMarker
//
//  Created by Nestor Hernandez on 10/03/22.
//

import Foundation

class PathItem: Identifiable, Equatable {
	var id: UUID = UUID()
	var value: Int
	var coordinates:Coordinates
	
	init(value:Int, coordinates:Coordinates){
		self.value = value
		self.coordinates = coordinates
	}
	
	
	static func == (lhs: PathItem, rhs: PathItem) -> Bool{
		(lhs.id == rhs.id) && (lhs.value == rhs.value)
	}
	
}
extension PathItem: Hashable {
	func hash(into hasher: inout Hasher) {
		hasher.combine(self.id)
	}
}

