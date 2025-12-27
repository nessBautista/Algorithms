//: [Previous](@previous)

import Foundation
struct Point: Hashable {
    let x: Int
    let y: Int
}

let grid:[[Int]] = [
    [1,1,1,1],
    [0,0,0,1],
    [0,0,0,1],
    [1,1,1,1]
]

let s = Point(x:0, y:0)
let e = Point(x:3, y:0)
func shortestPath(_ grid:[[Int]], _ s:Point, _ e:Point) -> Int {
    
    // Lets place auxiliary structs
    var seen:Set<Point> = [s]
    var fifo: [(point:Point, distance:Int)] = [(point:s, distance:0)]
    
    // Lets make the loop
    while !fifo.isEmpty {
        let current = fifo.removeFirst()
        // check if this is what we are looking for
        if current.point.x == e.x && current.point.y == e.y {
            return current.distance
        }
        
        // If not, lets prepare for the next search
        for delta in [(1,0),(0, 1), (-1, 0), (0, -1)] {
            let nextX = current.point.x + delta.0
            let nextY = current.point.y + delta.1
            let distance = current.distance + 1
            
            // Are these in the grid
            guard nextX >= 0, nextY >= 0,
                  nextX < grid.count, nextY < grid[0].count
            else{continue}
            
            // have we seen this before
            guard   !seen.contains(Point(x:nextX, y:nextY)) else
            {continue}
            
            // is this wakable
            guard  grid[nextX][nextY] == 1 else {continue}
            // Then we can add it
            // mark as seen, so we don’t add it again in later
            seen.insert(Point(x:nextX, y:nextY))
            fifo.append((
                point: Point(x:nextX, y:nextY),
                distance: distance
            ))
        }
    }
    return -1
}

print(shortestPath(grid, s, e))

//: [Next](@next)
