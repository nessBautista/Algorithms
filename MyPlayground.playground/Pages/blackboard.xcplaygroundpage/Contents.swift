import Foundation

struct Point: Hashable {
    let x: Int
    let y: Int
}

func orangeRotting(grid: inout [[Int]])->Int {
    var fifo:[Point] = []
    var fresh: Int = 0
    let rows =  grid.count
    let cols = grid[0].count
    var time = 0
    
    for x in 0..<rows {
        for y in 0..<cols {
            if grid[x][y] == 1 {
                fresh += 1
            } else if grid[x][y] == 2 {
                fifo.append(Point(x: x, y: y))
            }
            
        }
    }
    
    while !fifo.isEmpty && fresh > 0 {
        time += 1
        let layerSize = fifo.count
        
        for i in (0..<layerSize) {
            let current = fifo.removeFirst()
            for d in [(1,0),(0,1), (-1,0),(0,-1)] {
                let next = Point(x: current.x + d.0, y: current.y + d.1)
                guard next.x >= 0, next.y >= 0, next.x < rows, next.y < cols else { continue }
                guard grid[next.x][next.y] == 1 else { continue }
                
                fresh -= 1
                grid[next.x][next.y] = 2
                fifo.append(Point(x: next.x, y: next.y))
            }
        }
    }
    
    return fresh == 0 ? time : -1
}
var grid1 = [
     [2,1,1],
     [1,1,1],  // ← Changed middle-right from 0 to 1
     [0,1,2]   // ← Changed to create a connected path
 ]
var grid2 = [
    [2,1,1],
    [0,0,0],
    [1,1,1]
]


var grid3 = [
      [2,2],
      [2,2]
  ]

var grid4 = [
    [2,1,1],
    [1,1,1],
    [1,1,2]
]

print(orangeRotting(grid: &grid1))
print(orangeRotting(grid: &grid2))
print(orangeRotting(grid: &grid3))
print(orangeRotting(grid: &grid4))
