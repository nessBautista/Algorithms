//
//  NQueensViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 15/06/22.
//

import Foundation
enum DisplayState {
	case row
	case column
	case negativeDiagonal
	case positiveDiagonal
}
class Queens {
	func orderPlaneFor(_ n: Int, board: inout [[Int]]) -> [[[Int]]] {
		var output:[[[Int]]] = []
		
		var cols = Set<Int>()
		var posDiagonal = Set<Int>()
		var negDiagonal = Set<Int>()
		var count = 0
		
		func dfs(_ row: Int){
			if row == n {
				if count == n {
					output.append(board)
				}
				
				return
			}
			for col in 0..<board[row].count {
				let column = col
				let pd = col + row
				let nd = col - row
				if cols.contains(column)
					|| posDiagonal.contains(pd)
					|| negDiagonal.contains(nd) {
					continue
				}
				board[row][col] = 1
				count += 1
				cols.insert(column)
				posDiagonal.insert(pd)
				negDiagonal.insert(nd)
				dfs(row + 1)
				board[row][col] = 0
				count -= 1
				cols.remove(column)
				posDiagonal.remove(pd)
				negDiagonal.remove(nd)
				dfs(row + 1)
			}
			
		}
		dfs(0)
		return output
	}
}
class NQueensViewModel: ObservableObject {
	let queens: Queens = Queens()
	let width:Int
	let height:Int
	@Published var plane:[[Int]]
	@Published var displayState = DisplayState.row
	@Published var chessOutputCount:Int = 0
	var chessOutput: [[[Int]]] = []
	@Published var it: Int = 0
	
	init(width: Int, height: Int){
		self.width = width
		self.height = height
		self.plane = Array(repeating: Array(repeating:0, count:width),
						   count: height)
	}
	
	func getTitle(_ x: Int, _ y: Int) -> String {
		switch self.displayState {
		case .row:
			return "\(y)"
		case .column:
			return "\(x)"
		case .negativeDiagonal:
			return "\(x - y)"
		case .positiveDiagonal:
			return "\(x + y)"
		}
	}
	
	func placeNQueens(_ n: Int){
		self.chessOutput = self.queens.orderPlaneFor(n, board: &plane)
		for z in chessOutput {
			for row in z {
				print(row)
			}
			print("---------")
		}
		self.chessOutputCount = self.chessOutput.count
	}
	
	func next(){
		it += 1
		if it == chessOutputCount {
			it = 0
		}
		self.plane = chessOutput[it]
	}
}
