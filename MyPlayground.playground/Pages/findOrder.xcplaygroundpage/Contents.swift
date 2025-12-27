//: [Previous](@previous)

import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    // We will need the following structures
    var queue:[Int] = []
    var result: [Int] = []
    var adj:[Int:[Int]] = [:]
    var ndegree = Array(repeating:0, count: numCourses)
    
    // First we build the adj list and the ndegree
    for item in prerequisites {
        let course = item[0]
        let pre = item[1]
        adj[pre, default:[]].append(course)
        ndegree[course] += 1
    }
    
    // Then we initialize the processing queue with zero value ndegree elements
    for i in (0..<ndegree.count){
        if ndegree[i] == 0 {
            queue.append(i)
        }
    }
    
    // Now i can begin the processing cycle
    while !queue.isEmpty {
        // extract from queue
        let curr = queue.removeFirst()
        // append to result
        result.append(curr)
        // look for childrens in adj list and update ndegree
        for node in adj[curr, default: []] {
            ndegree[node] -= 1
            if ndegree[node] == 0 {
                queue.append(node)
            }
        }
    }
    
    return result.count == numCourses ? result: []
}

print(findOrder(3, [[1,0], [2,1]]))  // Should print [0, 1, 2]
print(findOrder(2, [[1,0], [0,1]]))  // Should print [] (cycle!)
//: [Next](@next)
