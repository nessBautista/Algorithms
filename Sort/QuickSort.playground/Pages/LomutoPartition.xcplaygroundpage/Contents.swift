//: [Previous](@previous)

import Foundation

func partitionLomuto<T:Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]
    
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            a.swapAt(i, j)
            i += 1
        }
        print(a)
    }
    a.swapAt(i, high)
    print(a)
    return i
}

//Note that list needs to be a var because partitionLomuto() directly changes the contents of the array (it is passed as an inout parameter). That is much more efficient than allocating a new array object.
var list = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]
let p = partitionLomuto(&list, low: 0, high: list.count - 1)
list  // show the results

//: [Next](@next)
