//: [Previous](@previous)

import Foundation


struct Point: Hashable {
    let x: Int
    let y: Int
}

var grid = [
    [1,0,1],
    [1,1,0],
    [0,1,1]
]

func dfs(_ grid: inout [[Int]], _ x: Int, _ y: Int) {
    // Check boundaries
    guard x >= 0, y >= 0, x < grid.count, y < grid[0].count else { return }
    // is this an island or have we seen this before?
    guard grid[x][y] == 1 else { return }
    // Now lets proceesed
    grid[x][y] = 0
    // Explore the vecinity clock wise
    dfs(&grid, x + 1, y)
    dfs(&grid, x, y + 1)
    dfs(&grid, x - 1, y)
    dfs(&grid, x, y - 1)
    
}
func islandCounter(_ grid: inout [[Int]]) -> Int {
    var counter = 0
    let rows = grid.count
    let cols = grid[0].count
    
    for r in (0..<rows){
        for c in (0..<cols){
            // is this an island or have we seen this before?
            guard grid[r][c] == 1 else { continue }
            // Yes, then lets update our counter
            counter += 1
            // Now lets explore it
            dfs(&grid, r, c)
        }
    }
    return counter
}

print(islandCounter(&grid))


//: [Next](@next)
