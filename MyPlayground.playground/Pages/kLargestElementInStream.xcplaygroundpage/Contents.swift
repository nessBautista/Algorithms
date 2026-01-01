//: [Previous](@previous)

import Foundation

struct MinHeap {
    var items: [Int] = []
    
    var count: Int { return items.count }
    
    func peek() -> Int? {
        return items.first
    }
    
    mutating func push(_ item: Int) {
        items.append(item)
        siftUp(from: items.count - 1)
    }
    
    mutating func pop() -> Int? {
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
        while child > 0 && items[child] < items[parent] {
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
            
            if left < count && items[left] < items[candidate] { candidate = left }
            if right < count && items[right] < items[candidate] { candidate = right }
            
            if candidate == parent { return }
            items.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
class KthLargest {
    let k: Int
    let nums: [Int]
    var minHeap = MinHeap()
    
    init(_ k: Int, _ nums: [Int]) {
        self.nums = nums
        self.k = k
        
        for n in nums {
            minHeap.push(n)
            if minHeap.count > k {
                _ = minHeap.pop()
            }
        }
    }
    
    func add(_ n: Int) -> Int {
        minHeap.push(n)
        if minHeap.count > k {
            _ = minHeap.pop()
        }
        return minHeap.peek()!
    }
}


func testKthLargest() {
    print("--- Test Case 1 ---")
    let k1 = KthLargest(3, [4, 5, 8, 2])
    print(k1.add(3))  // Expected: 4
    print(k1.add(5))  // Expected: 5
    print(k1.add(10)) // Expected: 5
    print(k1.add(9))  // Expected: 8
    print(k1.add(4))  // Expected: 8

    print("\n--- Test Case 2 ---")
    let k2 = KthLargest(1, [-10, -5])
    print(k2.add(-4))   // Expected: -4
    print(k2.add(-2))   // Expected: -2
    print(k2.add(-100)) // Expected: -2
    
    print("\n--- Test Case 3 ---")
    let k3 = KthLargest(3, [])
    print(k3.add(5))  // Expected: 5
    print(k3.add(2))  // Expected: 2
    print(k3.add(8))  // Expected: 2
    print(k3.add(1))  // Expected: 2
    print(k3.add(10)) // Expected: 5
}

testKthLargest()

//: [Next](@next)
