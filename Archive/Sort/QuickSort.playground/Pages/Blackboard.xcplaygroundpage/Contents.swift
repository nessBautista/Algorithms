//: [Previous](@previous)

import Foundation

func quickSort(_ a: [Int]) -> [Int] {
    guard a.count > 0 else {return a}
    
    //choose a pivot
    let pivot = a[a.count / 2]
    let lessThanPivot = a.filter {$0 < pivot}
    let equal = a.filter {$0 == pivot}
    let greaterThanPivot = a.filter {$0 > pivot}
    
    return quickSort(lessThanPivot)
        + equal
        + quickSort(greaterThanPivot)
}

var list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
let sorted = quickSort(list)
print(sorted)

//Dutch National Flag Partition
func DNF(a: inout [Int], low: Int, high: Int, pivotIdx: Int) {
    let pivot = a[pivotIdx]

    var small = low
    var equal = low
    var greater = high
    
    while equal <= greater {
        if a[equal] < pivot {
            a.swapAt(small, equal)
            small += 1
            equal += 1
        } else if a[equal] == pivot {
            equal += 1
        } else {
            a.swapAt(equal, greater)
            greater -= 1
        }
    }
}

list = [ 8, 10, 0, 3, 9, 2, 14, 20, 27, 1, 5, 8, -1, 26 ]
DNF(a: &list, low: 0, high: list.count - 1, pivotIdx: 0)
print(list)
//: [Next](@next)
