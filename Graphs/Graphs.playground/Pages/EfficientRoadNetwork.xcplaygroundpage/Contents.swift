//: [Previous](@previous)

import Foundation

/*:
 A road system is considered efficient if it is possible to travel from any city to any other city by traversing at most 2 roads.
 For n = 6 Here's how the road system can be represented:
    roads = [[3, 0], [0, 4], [5, 0], [2, 1], [1, 4], [2, 3], [5, 2]]
 */
//: ![Efficient road network representation](efficientRoad.png)

/*:
 For an inneficient road with  n = 6 Here's how the road system can be represented:
    roads = [[0, 4], [5, 0], [2, 1], [1, 4], [2, 3], [5, 2]]
 */

//: ![Not efficient road network representation](inneficientRoad.png)
/*
 Solution:
 1) Given the input type: [ [c1,c2], [c1,c3],.... ] we will construct the graph
 2) With the graph constructed I can proceed to perform a BFS from each city, while registering each node's parent array.
 3) With the parents register, I can track the path between my root city and the rest of the nodes. If one of these paths is greater than 2, then the network is inneficient.
 ***(We also need to take into account the unconnected cities or components)
 */

//Let's start by constructing the graph struct

class Node {
    var value:Int
    var next:Node?
    init(_ value:Int){
        self.value = value
    }
}

class Graph {
    var adjList:[Node?]  //the adjacency list containing the graph info
    var N:Int = 0 //The total number of nodes in the graph
    var discovered:[Bool] //helper for the traversal algorithm
    var parents: [Int] = [] // the register of parents
    
    init(numberOfNodes:Int) {
        self.N = numberOfNodes
        self.discovered = Array.init(repeating: false, count: self.N)
        self.parents = Array.init(repeating: -1, count: self.N)
        self.adjList = Array.init(repeating: nil, count: self.N)
    }
    
    //This is the function connecting to cities in the network
    func connect(source:Int, destination:Int, directed:Bool) {
        //Create the source and destination Nodes
        let src = Node(source)
        let dst = Node(destination)
        
        //Connect src->dst nodes using the adjancency list
        
        //set the destination node as first element of the source linked list
        //which is the linked list at index 'source'
        dst.next = self.adjList[source]
        self.adjList[source] = dst
        
        //if UNDIRECTED, the connect back destination to source
        if directed == false {
            connect(source: destination, destination: source, directed: true)
        }
    }
    
    
    func bfs(start:Int) {
        //Initialize parents and discovered array
        self.parents = Array<Int>.init(repeating: -1, count: self.N)
        self.discovered = Array<Bool>.init(repeating: false, count: self.N)
        
        var it:Node? //iterator helper
        
        //start by the given value
        var stack:[Int] = [start]
        self.discovered[start] = true
        
        //Continue until the queue of unexplored nodes has been emptied
        while stack.isEmpty == false {
            let expNode = stack.removeLast() //node being explore
            
            it = self.adjList[expNode]
            while it != nil {
                let value = it!.value
                if self.discovered[value] == false {
                    stack.append(value)
                    self.discovered[value] = true
                    self.parents[value] = expNode
                }
                it = it?.next
            }
        }
    }
    
    //this function will find the path between a source node and a destination.
    //The source is determined by the BFS traversal had started on the same source.
    func path(source:Int, destination:Int, path: inout [Int]) {
        //check for self connected paths or unconnected paths
        //a node with parent = -1 is not connected to anything
        guard source != destination || destination == -1 else {return}
        
        if parents[destination] != source {
            path.append(self.parents[destination])
        }
        self.path(source: source, destination: self.parents[destination], path: &path)
    }
    
    //construct graph for inputs of type:[[1,2], [2,4],...]
    //of size n
    class func constructGraph(n:Int, input:[[Int]]) -> Graph {
        let graph = Graph(numberOfNodes: n)
        for conexion in input {
            graph.connect(source: conexion[0], destination: conexion[1], directed: false)
        }
        return graph
    }
    
    //Here is where we implement our solution
    //For each node in the graph we perform a BFS traversal
    //then we check the connection between each city, if a connection
    //is greater than 2 then it is not efficient
    func isEfficient() -> Bool {
        for city in 0..<self.N {
            //bfs traversal from city
            self.bfs(start: city)
            
            //analyze each path
            for i in 0..<self.N {
                //avoid analysis with itself
                if city != i {
                    var path:[Int] = []
                    self.path(source: city, destination: i, path: &path)
                    print(path)
                    //Check for roads  passing trough 2 or more cities
                    if path.count > 2 {
                        return false
                    }
                    
                    //Check for disconnected paths
                    if path.contains(-1){
                        return false
                    }
                }
            }
        }
        return true
    }
}

func efficientRoadNetwork(n: Int, roads: [[Int]]) -> Bool {
    let graph = Graph.constructGraph(n: n, input: roads)
    return graph.isEfficient()
}


let efficient_roads = [[3, 0], [0, 4], [5, 0], [2, 1], [1, 4], [2, 3], [5, 2]]
let inefficient_roads = [[0, 4], [5, 0], [2, 1], [1, 4], [2, 3], [5, 2]]
let n = 6
efficientRoadNetwork(n: n, roads: efficient_roads)
//: [Next](@next)
