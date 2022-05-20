//
//  ViewModel.swift
//  PathMarker
//
//  Created by Nestor Hernandez on 10/03/22.
//

import Foundation
enum AppState {
	case loading
	case loaded
}
class ViewModel: ObservableObject {
	var pathItems:[[PathItem]]
	@Published var state:AppState = .loaded
	
	init() {
		var array = [[PathItem]]()
		for idx in (0..<10){
			array.append([])
			for idy in (0..<10){
				array[idx].append(PathItem(value: Int.random(in: 0...1), coordinates: Coordinates(x: idx, y: idy)))
			}
		}
		self.pathItems = array
	}
	
	func printItems(){
		for row in pathItems{
			print(row.map({$0.value}))
		}
	}
		
	func searchPath(_ c: Coordinates){
		self.state = .loading
		self.markPath(c)
		self.state = .loaded
	}
	
	
	func markPath(_ c: Coordinates) {
		print("Mark")
		guard pathItems[c.x][c.y].value != 0,
			  pathItems[c.x][c.y].value != 3,
			  !pathItems[c.x][c.y].coordinates.isOutOfBounds() else { return }
		self.state = .loading
		pathItems[c.x][c.y].value = 3
		self.state = .loaded
		
		for neighbor in neighborsArray {
			let targetCoordinates = pathItems[c.x][c.y].coordinates + Coordinates(x: neighbor.x, y: neighbor.y)
			
			if !targetCoordinates.isOutOfBounds(){
				self.markPath(targetCoordinates)
			}
		}
	}

	
	let neighborsArray: [(name: String, x:Int, y:Int)]  = [("north", 0, -1),
													  ("northWest", -1, -1),
													  ("west", -1, 0),
													  ("southWest",-1, 1),
													  ("south", 0, 1),
													  ("southEast", 1, 1),
													  ("east",1, 0),
													  ("northEast", 1, -1)
			]
}
