//: [Previous](@previous)

import Foundation

func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    
    print(a)
    while true {
        repeat { j -= 1 } while a[j] > pivot
        
        repeat { i += 1 } while a[i] < pivot
        
        if i < j {
            a.swapAt(i, j)
            print(a)
        } else {
            print(a)
            return j
        }
    }
}

var list = [ 8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26 ]
let p = partitionHoare(&list, low: 0, high: list.count - 1)
list  // show the results
//: [Next](@next)
