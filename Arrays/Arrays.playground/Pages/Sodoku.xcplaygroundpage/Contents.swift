//: [Previous](@previous)

/*
 Sudoku is a number-placement puzzle. The objective is to fill a 9 × 9 grid with numbers in such a way that each column, each row, and each of the nine 3 × 3 sub-grids that compose the grid all contain all of the numbers from 1 to 9 one time.

 Implement an algorithm that will check whether the given grid of numbers represents a valid Sudoku puzzle according to the layout rules described above. Note that the puzzle represented by grid does not have to be solvable.
 */
import Foundation

let grid: [[Character]] = [[".", ".", ".", "1", "4", ".", ".", "2", "."],
                           [".", ".", "6", ".", ".", ".", ".", ".", "."],
                           [".", ".", ".", ".", ".", ".", ".", ".", "."],
                           [".", ".", "1", ".", ".", ".", ".", ".", "."],
                           [".", "6", "7", ".", ".", ".", ".", ".", "9"],
                           [".", ".", ".", ".", ".", ".", "8", "1", "."],
                           [".", "3", ".", ".", ".", ".", ".", ".", "6"],
                           [".", ".", ".", ".", ".", "7", ".", ".", "."],
                           [".", ".", ".", "5", ".", ".", ".", "7", "."]]
let grid2: [[Character]] = [[".", ".", ".", ".", "2", ".", ".", "9", "."],
        [".", ".", ".", ".", "6", ".", ".", ".", "."],
        ["7", "1", ".", ".", "7", "5", ".", ".", "."],
        [".", "7", ".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", "8", "3", ".", ".", "."],
        [".", ".", "8", ".", ".", "7", ".", "6", "."],
        [".", ".", ".", ".", ".", "2", ".", ".", "."],
        [".", "1", ".", "2", ".", ".", ".", ".", "."],
        [".", "2", ".", ".", "3", ".", ".", ".", "."]]


func sudoku2(grid: [[Character]]) -> Bool {
    
    let n = grid.count
    //let N = n * n
    let m = Int(sqrt(Double(n)))
    
//    //subgrids
//    let subgrid = Array(repeating: Array(repeating: ".", count: m), count: m)
//    var subgrids = Array(repeating: subgrid, count: n)
    
    //registers
    var rowRegister: [Character: Int] = [:] //[val:pos]
    var columnRegister: [[Character :Int]] = Array(repeating: [:], count: n)//[[char: pos]]
    var subgridRegister:[[Character:(Int, Int)]] = Array(repeating: [:], count: n)//[[char: position]]
    
    //Build quadrants limits coordinate register
    var quadrantLimits:[(Int, Int)] = []
    for x in stride(from: m, through: n, by: m) {
        for y in stride(from: m, through: n, by: m) {
            quadrantLimits.append((x - 1,y - 1))
        }
    }
    
    // Given a coordinate, it returns the quadrant it belongs to
    func getQuadrant(coordinate: (Int, Int)) -> Int {
        for (idx, limit) in quadrantLimits.enumerated() {
                if coordinate.0 <= limit.0 && coordinate.1 <= limit.1 {
                    return idx
                }
            }
            return -1
    }
    
    // Add new item to rows, columns and subgrid registers
    func addToRegister(val: Character, x: Int, y: Int) -> Bool {
        if val == "." {
            return true
        }
        
        // add to row
        if rowRegister[val] == nil {
            rowRegister[val] = y
        } else {
            return false
        }
        // add to column
        if columnRegister[y][val] == nil {
            columnRegister[y][val] = x
        } else {
            return false
        }
        
        // add to subgrid
        let quadrantNumber = getQuadrant(coordinate: (x, y))
        if subgridRegister[quadrantNumber][val] == nil {
            subgridRegister[quadrantNumber][val] = (x,y)
        } else {
            return false
        }
        return true
    }
    
    // perform traversal
    for i in 0..<grid.count {
        var line: String = ""
        for j in 0..<grid[i].count {
            line += "(\(i/3),\(j/3)), "
            let val = grid[i][j]
            if !addToRegister(val: val, x: i, y: j) {
                return false
            }
        }
        print(line)
        rowRegister = [:]
    }
    return true
}



sudoku2(grid:grid)
//: [Next](@next)
