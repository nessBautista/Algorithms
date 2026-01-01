//: [Previous](@previous)

import Foundation

struct Position {
    let points: [Int]
    let distance: Int
}

struct MinHeap {
    var items: [Position] = []
    
    var count: Int { return items.count }
    
    func peek() -> Position? {
        return items.first
    }
    
    mutating func push(_ item: Position) {
        items.append(item)
        siftUp(from: items.count - 1)
    }
    
    mutating func pop() -> Position? {
        guard !items.isEmpty else { return nil }
        if items.count == 1 { return items.removeLast() }
        
        let root = items[0]
        items[0] = items.removeLast()
        siftDown(from: 0)
        return root
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && items[child].distance < items[parent].distance {
            items.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            
            if left < count && items[left].distance < items[candidate].distance { candidate = left }
            if right < count && items[right].distance < items[candidate].distance { candidate = right }
            
            if candidate == parent { return }
            items.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

func closesKPoints(points:[[Int]], k: Int) -> [[Int]] {
    var minHeap = MinHeap()
    
    for point in points {
        let distance = -((point[0] * point[0]) + (point[1] * point[1]))
        minHeap.push(Position(points: point, distance: distance))
        
        if minHeap.count > k {
            _ = minHeap.pop()
        }
                
    }
    
    return minHeap.items.map { $0.points }
}

print(closesKPoints(points: [[1,3], [-2,2]], k: 1))
print(closesKPoints(points: [[3,3], [5,-1], [-2,4]], k: 2))
print(closesKPoints(points: [[1,1], [0,1], [1,0]], k: 2))
//: [Next](@next)
