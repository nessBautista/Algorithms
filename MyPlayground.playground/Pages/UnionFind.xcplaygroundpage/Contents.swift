//: [Previous](@previous)

class UnionFind {
    var parent: [Int]
    
    init(_ n: Int) {
        self.parent = Array(0...n)
    }
    
    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        }
        return find(parent[x])
    }
    
    func union(_ x: Int, _ y: Int) -> Bool {
        let rootX = find(x)
        let rootY = find(y)
        
        if rootX == rootY { return false}
        parent[rootX] = rootY
        return true
    }
}

//: [Next](@next)
