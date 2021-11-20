//: [Previous](@previous)

import Foundation

func partitionDutchFlag<T: Comparable>(_ a: inout [T],
                                       low: Int,
                                       high: Int,
                                       pivotIndex: Int) -> (Int, Int) {
    let pivot = a[pivotIndex]
    var smaller = low
    var equal = low
    var larger = high
    print(a)
    while equal <= larger {
        if a[equal] < pivot {
            a.swapAt(equal, smaller)
            print(a)
            smaller += 1
            equal += 1
        } else if a[equal] == pivot {
            equal += 1
            print(a)
        } else {
            a.swapAt(equal, larger)
            print(a)
            larger -= 1
        }
    }
    return (smaller, larger)
}

var list = [ 10, 0, 3, 9, 2, 14, 20, 27, 1, 5, 8, -1, 26 ]
let (low, high) = partitionDutchFlag(&list, low: 0, high: list.count - 1, pivotIndex: 10)
print(low, high)

/*
func quicksortDutchFlag<T: Comparable>(_ a: inout [T],
                                       low: Int,
                                       high: Int) {
    if low < high {
        let pivotIndex = Int.random(in: (low...high))
        let (p, q) = partitionDutchFlag(&a, low: low, high: high, pivotIndex: pivotIndex)
        quicksortDutchFlag(&a, low: low, high: p-1)
        quicksortDutchFlag(&a, low: q + 1, high: high)
    }

}
quicksortDutchFlag(&list, low: 0, high: list.count - 1)
 */
//: [Next](@next)
