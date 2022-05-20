//: [Previous](@previous)

import Foundation

protocol Graph {
	associatedtype Element
	typealias Edge = GraphEdge<Element>
	typealias Vertex = Edge.Vertex
	var vertices:[Vertex] {get}
	
	@discardableResult mutating func addVertex(_ vertex: Element) -> Vertex
	func getEdges(from: Vertex)-> [Edge]
}

struct GraphVertex<Element>{
	let index: Int
	let element: Element
}
extension GraphVertex: Equatable where Element: Equatable {}
extension GraphVertex: Hashable where Element: Hashable {}
extension GraphVertex:Codable  where Element: Codable {}

struct GraphEdge<Element>{
	typealias Vertex = GraphVertex<Element>
	let source: Vertex
	let destination: Vertex
	let weight: Double
}
extension GraphEdge: Equatable where Element: Equatable{}

print("test")
//: [Next](@next)
