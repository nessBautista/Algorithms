//: [Previous](@previous)

import Foundation
class Node {
    var v: Int
    var next: Node?
    init(v:Int){
        self.v = v
        self.next = nil
    }
}

class Graph {
    var maxv: Int
    var adjList: [Int:Node] = [:]
    var degree:[Int] = []
    var nVertices: Int
    var nEdges: Int
    var parents:[Int]
    var discovered:[Bool]
    
    
    init(size: Int){
        self.maxv = size
        self.degree = Array<Int>.init(repeating: 0, count: size)
        self.nVertices = size
        self.nEdges = 0
        self.parents = []
        self.discovered = []
    }
    
    func connect(from source:Int, to destiny: Int, directed: Bool){
        //create vertex and add value
        let src = Node(v: source)
        src.v = source
        let dst = Node(v: destiny)
        dst.v = destiny
        
        //Connect the nodes via adjencency list
        dst.next = self.adjList[source]
        self.adjList[source] = dst
        self.degree[source] += 1
        
        if directed == false {
            self.connect(from: destiny, to: source, directed: true)
        } else {
            self.nEdges += 1
        }
    }
    
    func showAdjList(){
        for idx in self.adjList {
            var chain = "\(idx.key) = "
            var ptr: Node? = idx.value
            while ptr != nil {
                chain += "\(ptr!.v) -> "
                ptr = ptr?.next
            }
            print(chain)
        }
    }
    
    func bfs(start: Int){
        //Initialize search arrays
        self.parents = Array<Int>.init(repeating: -1, count: self.maxv)
        self.discovered = Array<Bool>.init(repeating: false, count: self.maxv)
        
        //Start with the given node
        var queue:[Int] =  [start]
        self.discovered[start] = true
        
        
        //lets visit each list within the Adj Array
        while queue.isEmpty == false {
            let idx = queue.removeFirst()
            var node = self.adjList[idx]
            while node != nil {
                let value = node!.v
                if self.discovered[value] == false {
                    queue.append(value)
                    self.discovered[value] = true
                    self.parents[value] = idx
                }
                node = node?.next
            }
            
        }
    }
    
    func dfs(start: Int){
        //Initialize search arrays
        self.parents = Array<Int>.init(repeating: -1, count: self.maxv)
        self.discovered = Array<Bool>.init(repeating: false, count: self.maxv)
        self.dfs_helper(start)
    }
    
    func dfs_helper(_ start:Int){
        self.discovered[start] = true
        
    }
    
    func findRoad(start:Int, end:Int, road:inout [Int]) {
        if start == end || end == -1 {
            return
        } else {
            if self.parents[end] != start {
                road.append(self.parents[end])
            }
            findRoad(start: start, end: self.parents[end], road: &road)
        }
    }
    
    
    func isEfficient()-> Bool {
        for city in 0..<self.nVertices {
            self.bfs(start: city)
            
            for i in 0..<self.nVertices {
                var road:[Int] = []
                if city != i {
                    self.findRoad(start: city, end: i, road: &road)
                }
                if road.count > 2 {
                    return false
                }
            }
        }
        return true
    }
}

let graph = Graph(size: 10)
graph.connect(from: 6, to: 1, directed: false)
graph.connect(from: 1, to: 2, directed: false)
graph.connect(from: 1, to: 5, directed: false)
graph.connect(from: 5, to: 2, directed: false)
graph.connect(from: 2, to: 3, directed: false)
graph.connect(from: 3, to: 4, directed: false)
graph.connect(from: 5, to: 4, directed: false)
//graph.showAdjList()
graph.bfs(start: 4)

var road = [Int]()
graph.findRoad(start: 4, end: 6, road: &road)
print(road)


func buildGraph(n: Int, roads: [[Int]]) -> Graph {
    let graph = Graph(size: 10)
    for edge in roads {
        graph.connect(from: edge[0], to: edge[1], directed: false)
    }
    
    return graph
}


//: [Next](@next)
