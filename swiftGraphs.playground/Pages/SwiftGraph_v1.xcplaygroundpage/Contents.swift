//: [Previous](@previous)

import Foundation

public struct Vertex<T: Hashable> {
  var data: T
}

extension Vertex: Hashable {
  public var hashValue: Int { // 1
      return "\(data)".hashValue
  }
  
  static public func ==(lhs: Vertex, rhs: Vertex) -> Bool { // 2
    return lhs.data == rhs.data
  }
}

extension Vertex: CustomStringConvertible {
  public var description: String {
    return "\(data)"
  }
}


public enum EdgeType {
  case directed, undirected
}

public struct Edge<T: Hashable> {
  public var source: Vertex<T> // 1
  public var destination: Vertex<T>
  public let weight: Double? // 2
}

extension Edge: Hashable {
  
  public var hashValue: Int {
      return "\(source)\(destination)\(weight)".hashValue
  }
  
  static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    return lhs.source == rhs.source &&
      lhs.destination == rhs.destination &&
      lhs.weight == rhs.weight
  }
}

protocol Graphable {
  associatedtype Element: Hashable // 1
  var description: CustomStringConvertible { get } // 2
   
  
  func createVertex(data: Element) -> Vertex<Element> // 3
  func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) // 4
  func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? // 5
  func edges(from source: Vertex<Element>) -> [Edge<Element>]? // 6
}

open class AdjacencyList<T: Hashable> {
    public var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    public var vertexs: [Vertex<T>] = []
    public init() {}
}

extension AdjacencyList: Graphable {
    public typealias Element = T
    public func createVertex(data:Element) -> Vertex<Element> {
        //create vertex
        let vertex = Vertex(data:data)
        
        //Create (if necessary) a new register for the vertex in the adjacency dictionaru
        if  adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        
        vertexs.append(vertex)
        return vertex
    }
    
    fileprivate func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        //This function creates and (DIRECTED) edge
        let edge = Edge(source: source, destination: destination, weight: weight)
        //Add this edge to the adjacency information
        adjacencyDict[source]?.append(edge)
    }
    
    fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight:weight)
        addDirectedEdge(from: destination, to: source, weight:weight)
    }
    
    public func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        if type == .directed {
            addDirectedEdge(from: source, to: destination, weight:weight)
        } else {
            addUndirectedEdge(vertices:(source, destination), weight:weight)
        }
    }
    
    public func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
      guard let edges = adjacencyDict[source] else { // 1
        return nil
      }
      
      for edge in edges { // 2
        if edge.destination == destination { // 3
          return edge.weight
        }
      }
      
      return nil // 4
    }
    
    public func edges(from source: Vertex<Element>) -> [Edge<Element>]? {
      return adjacencyDict[source]
    }
    
    public var description: CustomStringConvertible {
      var result = ""
      for (vertex, edges) in adjacencyDict {
        var edgeString = ""
        for (index, edge) in edges.enumerated() {
          if index != edges.count - 1 {
            edgeString.append("\(edge.destination), ")
          } else {
            edgeString.append("\(edge.destination)")
          }
        }
        result.append("\(vertex) ---> [ \(edgeString) ] \n ")
      }
      return result
    }
    
    func bfs(start: Vertex<Element>) -> (parents:[Vertex<Element>:Vertex<Element>], discovered:[Vertex<Element>: Bool], level:[Vertex<Element>: Int]){
        var queue:[Vertex<Element>] = [] //queue of vertex to visit
        var v: Vertex<Element>       //current vertex
        var y: Vertex<Element>       //Successor vertex
        var temp_edges:[Edge<Element>]?      //temporary vertex
        
        var discovered:[Vertex<Element>: Bool] = [:]
        var level:[Vertex<Element>:Int] = [:]
        var parents:[Vertex<Element>:Vertex<Element>] = [:]
    
        //add the bfs starting point to the queue
        queue.append(start)
        //Set node to discovered
        discovered[start] = true
        //set starting level to 0
        var i = 0
        level[start] = i
        
        while queue.isEmpty == false {
            //Set you current vertex position
            v = queue.removeFirst()
            //Get array of edges
            temp_edges = adjacencyDict[v]
            //iterate through adjacency list
            for edge in temp_edges ?? [] {
                let destination = edge.destination
                 
                //prepare to mark the next level of vertex                
                
                //Check if destination hasn't been discovered
                if discovered[destination] == nil {
                    queue.append(destination)       //we need to add it to the explorer search
                    parents[destination] = v         //register its parent
                    discovered[destination] = true  //mark as discovered
                    level[destination] = i
                    print("the parent of \(destination.description) is \(v.description)")
                }
            }
        }
        return (parents,discovered, level)
    }
}


//let adjacencyList = AdjacencyList<String>()
//let singapore = adjacencyList.createVertex(data: "Singapore")
//let tokyo = adjacencyList.createVertex(data: "Tokyo")
//let hongKong = adjacencyList.createVertex(data: "Hong Kong")
//let detroit = adjacencyList.createVertex(data: "Detroit")
//let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
//let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
//let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
//let seattle = adjacencyList.createVertex(data: "Seattle")
//
//adjacencyList.add(.undirected, from: singapore, to: hongKong, weight: 300)
//adjacencyList.add(.undirected, from: singapore, to: tokyo, weight: 500)
//adjacencyList.add(.undirected, from: hongKong, to: tokyo, weight: 250)
//adjacencyList.add(.undirected, from: tokyo, to: detroit, weight: 450)
//adjacencyList.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
//adjacencyList.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
//adjacencyList.add(.undirected, from: detroit, to: austinTexas, weight: 50)
//adjacencyList.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
//adjacencyList.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
//adjacencyList.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
//adjacencyList.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
//adjacencyList.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)
//
//adjacencyList.description
//print("->>>>> BFS")
//adjacencyList.bfs(start: singapore)
//
//let graph = AdjacencyList<Int>()
//let n1 = graph.createVertex(data: 1)
//let n2 = graph.createVertex(data: 2)
//let n3 = graph.createVertex(data: 3)
//let n4 = graph.createVertex(data: 4)
//let n5 = graph.createVertex(data: 5)
//let n6 = graph.createVertex(data: 6)
//
//graph.add(.undirected, from: n6, to: n1, weight: 1)
//graph.add(.undirected, from: n1, to: n2, weight: 1)
//graph.add(.undirected, from: n1, to: n5, weight: 1)
//graph.add(.undirected, from: n2, to: n5, weight: 1)
//graph.add(.undirected, from: n2, to: n3, weight: 1)
//graph.add(.undirected, from: n3, to: n4, weight: 1)
//graph.add(.undirected, from: n4, to: n5, weight: 1)
//
//
//let bfs = graph.bfs(start: n1)

let road1 = AdjacencyList<Int>()
let r1_city0 = road1.createVertex(data: 0)
let r1_city1 = road1.createVertex(data: 1)
let r1_city2 = road1.createVertex(data: 2)
let r1_city3 = road1.createVertex(data: 3)
let r1_city4 = road1.createVertex(data: 4)
let r1_city5 = road1.createVertex(data: 5)
road1.add(.undirected, from: r1_city1, to: r1_city4, weight: 1)
road1.add(.undirected, from: r1_city1, to: r1_city2, weight: 1)
road1.add(.undirected, from: r1_city2, to: r1_city3, weight: 1)
road1.add(.undirected, from: r1_city2, to: r1_city5, weight: 1)
road1.add(.undirected, from: r1_city3, to: r1_city0, weight: 1)
road1.add(.undirected, from: r1_city0, to: r1_city5, weight: 1)


let road2 = AdjacencyList<Int>()
let r2_city0 = road2.createVertex(data: 0)
let r2_city1 = road2.createVertex(data: 1)
let r2_city2 = road2.createVertex(data: 2)
let r2_city3 = road2.createVertex(data: 3)
let r2_city4 = road2.createVertex(data: 4)
let r2_city5 = road2.createVertex(data: 5)
road2.add(.undirected, from: r2_city1, to: r2_city4, weight: 1)
road2.add(.undirected, from: r2_city1, to: r2_city2, weight: 1)
road2.add(.undirected, from: r2_city2, to: r2_city3, weight: 1)
road2.add(.undirected, from: r2_city2, to: r2_city5, weight: 1)
road2.add(.undirected, from: r2_city0, to: r2_city5, weight: 1)
for city in road2.vertexs {
    let levels = road2.bfs(start: city).level
    print(levels)
    
}
