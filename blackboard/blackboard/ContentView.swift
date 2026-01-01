//
//  ContentView.swift
//  blackboard
//

import SwiftUI

struct ContentView: View {
    // Your 2D array - modify this as needed
    let grid: [[Int]] = [
        [1, 0, 1, 0, 1],
        [0, 0, 1, 0, 1],
        [1, 0, 0, 0, 0],
        [1, 0, 0, 1, 0]
    ]
    
    var body: some View {
        VStack {
            ForEach(0..<grid.count, id: \.self) { row in
                HStack {
                    ForEach(0..<grid[row].count, id: \.self) { col in
                        Rectangle()
                            .fill(grid[row][col] == 0 ? .blue: .orange)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            Text("# of Islands: \(islandCounter(grid))")
        }
    }
    
    
    func islandCounter(_ grid: [[Int]]) -> Int {
        var counter = 0
        var grid = grid
        // Iterate through the grid, during our traversal,
        // if we find a 1, we have found a new island
        // We increase the counter, and we explore this new island (DFS)
        let rows = grid.count
        let cols = grid[0].count
        for r in (0..<rows) {
            for c in (0..<cols) {
                if grid[r][c] == 1 {
                    counter += 1
                    //DFS
                    dfs(grid: &grid, x: r, y: c)
                }
            }
        }
        
        func dfs(grid: inout [[Int]], x: Int, y: Int) {
            // Check if current value is a 1
            // if it is, mark it as zero
            //if it is not, then we arrive to a non island, we can exit
            guard x >= 0, x < grid.count,
                  y >= 0, y < grid[0].count else { return }
            guard grid[x][y] == 1 else { return }
            grid[x][y] = 0
            //Then we need to continue the exploration to other neighbors
            dfs(grid: &grid, x: x+1, y: y)
            dfs(grid: &grid, x: x, y: y+1)
            dfs(grid: &grid, x: x-1, y: y)
            dfs(grid: &grid, x: x, y: y-1)
        }
        
        return counter
        
    }
}

#Preview {
    ContentView()
}
