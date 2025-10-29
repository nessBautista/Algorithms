import UIKit

var array = [[1,0,0,0,0],
             [0,1,0,0,0],
             [0,0,1,1,1],
             [0,0,1,0,0],
             [0,0,1,0,0]]

func printArray(a: [[Int]]){
    for row in a {
        print(row)
    }
}
func markPath(a: inout [[Int]], x:Int, y:Int){
    //mark
    mark(a: &a, x: x, y: y)
    //Visit neighbors
    visitNeighbors(a: &a, x: x, y: y)
}

func visitNeighbors(a: inout [[Int]], x:Int, y:Int) {
    // Get Neighbors
    let neighbors = getNeighbors(a: &a, x: x, y: y)
    
    // Traverse and apply Recursion if necessary
    for n in neighbors {
        if n.val == 1 && n.val != 3 {
            markPath(a: &a, x: n.x, y: n.y)
        }
    }
}

func addNeighbord(a: inout [[Int]],
                  ns: inout [(val: Int, x:Int, y:Int)],
                  x: Int,
                  y:Int) {
    
    guard x >= 0, y >= 0 else {
        return
    }
    guard x < a.count, y < a[x].count else {
        return
    }
    let neighbor = (a[x][y],x,y)
    ns.append(neighbor)
}

func mark(a: inout [[Int]], x:Int, y:Int) {
    a[x][y] = 3
}

func getNeighbors(a: inout [[Int]], x:Int, y:Int) -> [(val: Int, x:Int, y:Int)] {
    var neighbors: [(val: Int, x:Int, y:Int)] = []
    // go clockwise,start at 12 o'clock
    for n in 0..<8 {
        if n == 0 { //12
            let nx = x-1
            let ny = y
            addNeighbord(a: &a,
                         ns: &neighbors,
                         x: nx,
                         y: ny)
        }
        if n == 1 { //2
            let nx = x-1
            let ny = y+1
            addNeighbord(a: &a,
                         ns: &neighbors,
                         x: nx,
                         y: ny)
        }
        if n==2{ //3
            let nx = x
            let ny = y+1
            addNeighbord(a: &a,
                         ns: &neighbors,
                         x: nx,
                         y: ny)
        }
        if n==3{ //5
            let nx = x+1
            let ny = y+1
            addNeighbord(a: &a,
                         ns: &neighbors,
                         x: nx,
                         y: ny)
        }
        if n==4{ //6
            let nx = x+1
            let ny = y
            addNeighbord(a: &a,
                         ns: &neighbors,
                         x: nx,
                         y: ny)
        }
        if n==5{ //7
            let nx = x + 1
            let ny = y - 1
            addNeighbord(a: &a,
                         ns: &neighbors,
                         x: nx,
                         y: ny)
        }
        if n==6{ //9
            let nx = x
            let ny = y-1
            addNeighbord(a: &a,
                         ns: &neighbors,
                         x: nx,
                         y: ny)
        }
        if n==2{ //11
            let nx = x-1
            let ny = y-1
            addNeighbord(a: &a,
                         ns: &neighbors,
                         x: nx,
                         y: ny)
        }
    
    }
    
    return neighbors
}



markPath(a: &array, x: 0, y: 0)
printArray(a: array)
print("------>")
var array2 = [[0,1,0,0,0],
              [0,1,0,0,0],
              [1,0,1,0,0],
              [1,0,1,0,0],
              [1,0,1,0,0]]
markPath(a: &array2, x: 3, y: 1)
printArray(a: array2)
