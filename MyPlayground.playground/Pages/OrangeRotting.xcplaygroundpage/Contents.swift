//: [Previous](@previous)
struct Point{
    let x: Int
    let y: Int
}

func orangeRotting(grid: inout [[Int]])-> Int {
    //lets keep record of the fresh items
    var fresh = 0
    // we need to queue to keep track of exploration
    var fifo:[Point] = []
    let directions:[(Int, Int)] = [(1,0), (0, 1), (-1, 0), (0, -1)]
    // traverse grid in search of 1’s for the fresh counter
    // and 2’s for the queue
    
    for i in 0..<grid.count{
        for j in 0..<grid[0].count {
            if grid[i][j] == 1 {
                fresh += 1
            } else if grid[i][j] == 2 {
                fifo.append(Point(x: i, y:j))
            }
        }
    }
    
    // At this point we got a queue containing 2’s
    // we need to explore the neighbors of these 2’s
    // as the ripple will traverse those that are 1’s
    
    // we check until there are no element 2’s in the queue
    // and if the fresh counter has returned to zero, this would mean
    // that all elements have been marked as 2 and we can return
    
    // this variable will hold the result, it will tell us how many
    // cycles until all possible elements have been set to 2
    var minutes = 0
    while !fifo.isEmpty && fresh > 0 {
        minutes += 1
        let layerSize = fifo.count
        for _ in (0..<layerSize) {
            let curr = fifo.removeFirst()
            
            for delta in directions {
                let nextX = curr.x + delta.0
                let nextY = curr.y + delta.1
                let next = Point(x: nextX, y: nextY)
                // check boundaries
                guard next.x >= 0, next.y >= 0,
                      next.x < grid.count, next.y < grid[0].count
                else {continue}
                
                //check if we can mark it
                guard grid[next.x][next.y] == 1 else {continue}
                
                // We have found a candidate, lets mark it
                grid[next.x][next.y] = 2
                // decrease fresh counter
                fresh -= 1
                //and append to our fifo for later
                fifo.append(Point(x: next.x, y: next.y))
            }
            
            
            
        }
    }
    // we have move out of the loop, either because there are no more
    // 1’s we can mark as 2’s or because the remaining 1’s are
    // unreachable
    return fresh == 0 ? minutes : -1
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
//: [Next](@next)
