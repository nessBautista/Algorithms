import UIKit

var str = "Hello, playground"
class Node {
    
    var value: Int?
    var edges: [Edge]
    var visited = false
    
    init(value: Int?) {
        self.value = value
        self.edges = []
    }
}

class Edge {
    
    var value: Int?
    var nodeFrom: Node?
    var nodeTo: Node?
    
    init(value: Int?, nodeFrom: Node?, nodeTo: Node?) {
        self.value = value
        self.nodeFrom = nodeFrom
        self.nodeTo = nodeTo
    }
}

class Graph {
    
    var nodes: [Node]
    var edges: [Edge]
    
    init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }
    
    // Don't return an array of edge objects!
    // Return an array of arrays where inner arrays look like
    // (Edge Value, From Node Value, To Node Value)
    func getEdgeList() -> [[Int]] {
        var edgeList = [[Int]]()
        for edge in edges {
            edgeList.append([edge.value ?? 0 , edge.nodeFrom?.value ?? 0,  edge.nodeTo?.value ?? 0])
        }
        return edgeList
    }
    
    // Don't return any Node or Edge objects!
    // You'll return a 3D array
    // The indices of the outer list represent "from" nodes.
    // Each section in the array will store an array of arrays where the inner-most arrays look like
    // (To Node Value, Edge Value)
    func getAdjacencyList() -> [[[Int]]] {
//        let max = getMaxIndex()
//        var adjacencyList = [[[Int]]]()
//
//        for idx in 0...max {
//            if let node = self.nodes.first(where: {$0.value == idx}) {
//                var edgesInfo = [[Int]]()
//                let edges = self.edges.filter({$0.nodeFrom?.value == node.value})
//                edges.forEach({edgesInfo.append([$0.nodeTo?.value ?? 0, $0.value ?? 0])})
//                adjacencyList.append(edgesInfo)
//            } else {
//                adjacencyList.append([])
//            }
//        }
//        return adjacencyList
        let max = getMaxIndex()
        var adjacencyList = [[[Int]]]()
        
        for _ in 0...max {
            adjacencyList.append([])
        }
        
        for edgeObject in edges {
            if !adjacencyList[(edgeObject.nodeFrom?.value)!].isEmpty {
                adjacencyList[(edgeObject.nodeFrom?.value)!].append([edgeObject.nodeTo!.value!, edgeObject.value!])
            } else {
                adjacencyList[edgeObject.nodeFrom!.value!] = [[edgeObject.nodeTo!.value!, edgeObject.value!]]
            }
        }
        
        return adjacencyList
    }
    
    // Return a matrix, or 2D array.
    // Row numbers represent from nodes.
    // Column numbers represent to nodes.
    // Store the edge values in each spot, and a 0 if no edge exists.
    func getAdjacencyMatrix() -> [[Int]] {
        let max = getMaxIndex()
        var adjacencyMatrix = [[Int]]()
        for row in 0...max {
            var rowArray = [Int]()
            for col in 0...max{
                if let edge = self.edges.first(where: {$0.nodeFrom?.value == row && $0.nodeTo?.value == col}) {
                    rowArray.append(edge.value ?? 0)
                } else {
                    rowArray.append(0)
                }
            }
            adjacencyMatrix.append(rowArray)
        }
        
        return adjacencyMatrix
    }
    
    // Helper to be used with adjacency list and adjacency matrix
    // max node value determines the size of the array
    func getMaxIndex() -> Int {
        var maxIndex = 0
        
        for node in nodes {
            if node.value! > maxIndex {
                maxIndex = node.value!
            }
        }
        
        return maxIndex
    }
    
    // creates a node with a given value and inserts it into the graph
    func insertNodeWithValue(_ value: Int) {
        let newNode = Node(value: value)
        nodes.append(newNode)
    }
    
    // inserts an edge between the "to" and "from" nodes with the specified values
    func insertEdgeWithValue(_ newEdgeValue: Int, nodeFromValue: Int, nodeToValue: Int) {
        var fromFound: Node? = nil
        var toFound: Node? = nil
        
        for node in nodes {
            if nodeFromValue == node.value {
                fromFound = node
            }
            if nodeToValue == node.value {
                toFound = node
            }
        }
        
        if fromFound == nil {
            fromFound = Node(value: nodeFromValue)
            nodes.append(fromFound!)
        }
        if toFound == nil {
            toFound = Node(value: nodeToValue)
            nodes.append(toFound!)
        }
        
        let newEdge = Edge(value: newEdgeValue, nodeFrom: fromFound, nodeTo: toFound)
        fromFound?.edges.append(newEdge)
        toFound?.edges.append(newEdge)
        edges.append(newEdge)
    }
    
    


    func dfs(_ startNode: Node) -> [Int] {
        let visited = [startNode.value!]
        
        return dfsHelper(startNode, visited: visited)
    }
    
    // Create an iterative implementation.
    // Return a list of the node values.
    func bfs(_ startNode: Node) -> [Int] {
        var visited: [Int] = []
        var toVisit: [Node] = [] // Treat this array as a queue
        
        toVisit.append(startNode)
        visited.append(startNode.value!)
        startNode.visited = true
        
        while !toVisit.isEmpty {
            let node = toVisit.removeFirst()
            
            for edgeObject in node.edges {
                let neighborNode = edgeObject.nodeTo
                
                if !(neighborNode?.visited)! {
                    toVisit.append(neighborNode!)
                    neighborNode?.visited = true
                    visited.append((neighborNode?.value)!)
                }
            }
        }
        return visited
    }
    
    // helper method - use to implement DFS recursively
    func dfsHelper(_ current: Node, visited: [Int]) -> [Int] {
        var result = visited
        
        for edgeObject in current.edges {
            if !result.contains((edgeObject.nodeTo?.value)!) {
                result.append(edgeObject.nodeTo!.value!)
                result = dfsHelper(edgeObject.nodeTo!, visited: result)
            }
        }
        return result
    }
    
 
}

// Test cases
let graph = Graph(nodes: [], edges: [])
graph.insertEdgeWithValue(100, nodeFromValue: 1, nodeToValue: 2)
graph.insertEdgeWithValue(101, nodeFromValue: 1, nodeToValue: 3)
graph.insertEdgeWithValue(102, nodeFromValue: 1, nodeToValue: 4)
graph.insertEdgeWithValue(103, nodeFromValue: 3, nodeToValue: 4)

print(graph.getEdgeList()) // Should be [(100, 1, 2), (101, 1, 3), (102, 1, 4), (103, 3, 4)]
print(graph.getAdjacencyList()) // Should be [[], [(2, 100), (3, 101), (4, 102)], [], [(4, 103)], []]
print(graph.getAdjacencyMatrix()) // Should be [[0, 0, 0, 0, 0], [0, 0, 100, 101, 102], [0, 0, 0, 0, 0], [0, 0, 0, 0, 103], [0, 0, 0, 0, 0]]


print(graph.dfs(graph.nodes[0])) // Should be [1, 2, 3, 4]
print(graph.bfs(graph.nodes[0])) // Should be [1, 2, 3, 4]


