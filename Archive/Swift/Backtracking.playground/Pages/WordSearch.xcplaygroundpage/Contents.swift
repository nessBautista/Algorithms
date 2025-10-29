//: [Previous](@previous)

import Foundation

var register:[Neighbor: Bool] = [:]

class Neighbor: Hashable, Equatable {
	var x: Int = 0
	var y: Int = 0
	
	init?(x: Int, y: Int, board:[[Character]]){
		guard x >= 0, y >= 0 else {return nil}
		guard y < board.count else {return nil}
		guard x < board[y].count else {return nil}
		self.x = x
		self.y = y
	}
	static func ==(lhs: Neighbor, rhs: Neighbor) -> Bool {
		(lhs.x == rhs.x) && (lhs.y == rhs.y)
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(self.x)
		hasher.combine(self.y)
	}
}



func neighbors(_ n: Neighbor, board: [[Character]])-> [Neighbor]{
	var neighbors:[Neighbor] = []
	register[n] = true
	// North
	if let north = Neighbor(x: n.x, y: n.y - 1, board: board) {
		if register[north] == nil {
			neighbors.append(north)
		}
	}
	// West
	if let west = Neighbor(x: n.x - 1, y: n.y, board: board) {
		
		if register[west] == nil {
			neighbors.append(west)
		}
	}
	// East
	if let east = Neighbor(x: n.x + 1, y: n.y, board: board) {
		if register[east] == nil {
			neighbors.append(east)
		}
	}
	// South
	if let south = Neighbor(x: n.x, y: n.y + 1, board: board) {
		if register[south] == nil {
			neighbors.append(south)
		}
	}
	print("Neighbors count: \(neighbors.count)")
	neighbors.forEach({print(board[$0.y][$0.x])})
	return neighbors
}

func exist(_ board: [[Character]], _ word: String) -> Bool {
	var memo: [String: Bool] = [:]
	for (y, row) in board.enumerated(){
		for (x, char) in row.enumerated() {
			if word.starts(with: String(char)){
				if let neighbor = Neighbor(x: x, y: y, board: board) {
					let neighbors = neighbors(neighbor, board: board)
					if dfs(1, neighbors) {
						return true
					}
				}
			}
			register = [:]
			
		}
	}
	
	func dfs(_ idx: Int, _ neighborsArray:[Neighbor]) -> Bool {
		if idx == word.count {
			print("reached idx:\(idx)")
			return true
		}
		
		if let exist = memo[word[idx]]{
			print("Used memmo:\(exist), for word:\(word[idx])")
			return exist
		}
		
		var evaluation = false
		for n in neighborsArray {
			if word[idx].starts(with: String(board[n.y][n.x])) {
				print("\(word[idx]) starts with: \(String(board[n.y][n.x])) at \(n.y), \(n.x)")
				let neighbors = neighbors(n, board: board)
				if dfs(idx + 1, neighbors){
					evaluation = true
					memo[word[idx]] = true
				} else {
					register[n] = nil
					memo[word[idx]] = false
				}
			}
		}		
		return evaluation
	}
	return false
}

extension String {
	subscript(_ idx: Int)-> String {
		String(self[self.index(self.startIndex, offsetBy: idx)..<self.endIndex])
	}
}



let board:[[Character]] = [["A","B","C","E"],
						   ["S","F","C","S"],
						   ["A","D","E","E"]]


exist(board, "SEE")




//: [Next](@next)
