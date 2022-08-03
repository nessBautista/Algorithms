//
//  PathMarkerViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 14/06/22.
//

import Foundation

class PathMarkerViewModel:ObservableObject {
	@Published var dataSource:[[Int]]
	var columns: Int
	var rows: Int
	let pathFinder: PathFinder
	
	init(_ x: Int, _ y: Int){
		self.rows = y
		self.columns = x
		dataSource = Array(repeating: [], count: y)
		self.pathFinder = PathFinder(width: x, height: y)
		
		for row in 0..<y {
			for _ in 0..<x {
				dataSource[row].append(Int.random(in: 0...1))
			}
		}
		print(dataSource)
	}

	func findPath(_ x: Int, y: Int){
		pathFinder.findPaths(&dataSource, x: x, y: y)
	}
}

class PathFinder {
	let width: Int
	let height: Int
	
	init(width: Int, height: Int){
		self.width = width
		self.height = height
	}
	
	func findPaths(_ data: inout [[Int]], x: Int, y: Int){
		let target = data[y][x]
		
		func dfs(_ data: inout [[Int]], target: Int, x: Int, y: Int){
			//base case
			let current = data[y][x]
			if current != target {
				return
			}
			if current == 2 {
				return
			}
			
			data[y][x] = 2
			let neighbors = self.getNeighbors(x, y: y)
			for n in neighbors {
				dfs(&data, target:target, x: n.x, y: n.y)
			}
		}
		
		dfs(&data, target: target, x: x, y: y)
	}
	
	func getNeighbors(_ x: Int, y: Int)->[(x:Int, y:Int)] {
		var output: [(x:Int, y:Int)] = []
		for neighbor in Neighbors.allCases {
			switch neighbor {
			case .north:
				let ny = y - 1
				if ny >= 0 {
					output.append((x,ny))
				}
			case .northEast:
				let ny = y - 1
				let nx = x + 1
				if ny >= 0 && nx < width {
					output.append((nx,ny))
				}
			case .east:
				let nx = x + 1
				if nx < width {
					output.append((nx,y))
				}
			case .southEast:
				let ny = y + 1
				let nx = x + 1
				if ny < height && nx < width {
					output.append((nx,ny))
				}
			case .south:
				let ny = y + 1
				if ny < height{
					output.append((x,ny))
				}
			case .southWest:
				let nx = x - 1
				let ny = y + 1
				if nx >= 0, ny < height{
					output.append((nx,ny))
				}
			case .west:
				let nx = x - 1
				if nx >= 0 {
					output.append((nx,y))
				}
			case .northWest:
				let nx = x - 1
				let ny = y - 1
				if nx >= 0, ny >= 0{
					output.append((nx,ny))
				}
			}
		}
		return output
	}
}

enum Neighbors: CaseIterable {
	case north
	case northEast
	case east
	case southEast
	case south
	case southWest
	case west
	case northWest
}
