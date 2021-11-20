//: [Previous](@previous)

import Foundation

func quicksortDutchFlag(_ a: inout [Int], low: Int, high: Int) {
    if low < high {
        let pivotIdx = Int.random(in: low...high)
        let (p,q) = dutchFlagPartition(&a, low, high, pivotIdx)
        quicksortDutchFlag(&a, low: low, high: p-1)
        quicksortDutchFlag(&a, low: q + 1, high: high)
    }
}
func dutchFlagPartition(_ a: inout [Int],
                        _ low: Int,
                        _ high: Int,
                        _ pivotIdx: Int) -> (Int, Int) {
    let pivot = a[pivotIdx]
    var smaller = low
    var equal = low
    var larger = high
    
    while equal <= larger {
        if a[equal] < pivot {
            a.swapAt(equal, smaller)
            smaller += 1
            equal += 1
        } else if a[equal] == pivot {
            equal += 1
        } else {
            a.swapAt(equal, larger)
            larger -= 1
        }
    }
    return (smaller, larger)
}

var list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
/* pivot = 8
 start -> [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
  (s,e)                                 l
 [ 26, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 10 ]
 (s,e)                              l
 [ -1, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, 26, 10 ]
      (s,e)                           l
 [ -1,  0,  3, 9, 2, 14, 8, 27, 1, 5, 8, 26, 10 ]
        (s,e)                       l
 [ -1, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, 26, 10 ]
           (s,e)                 l
 [ -1, 0, 3, 8, 2, 14, 8, 27, 1, 5, 9, 26, 10 ]
             s  e                l
 [ -1, 0, 3, 8, 2, 14, 8, 27, 1, 5, 9, 26, 10 ]
                s  e             l
 [ -1, 0, 3, 2, 8, 14, 8, 27, 1, 5, 9, 26, 10 ]
                s  e         l
 [ -1, 0, 3, 2, 8, 5, 8, 27, 1, 14, 9, 26, 10 ]
                   s  e      l
 [ -1, 0, 3, 2, 5, 8, 8, 27, 1, 14, 9, 26, 10 ]
                   s     e   l
 [ -1, 0, 3, 2, 5, 8, 8, 27, 1, 14, 9, 26, 10 ]
                   s    (e,l)  <- 'equal==larger, puede hacer un ciclo mas'
 [ -1, 0, 3, 2, 5, 8, 8,  1,  27, 14, 9, 26, 10 ]
                      s   l   e  <- 'equal > larger' el ciclo acaba aqui
 [ -1, 0, 3, 2, 5, 1, 8,  8,  27, 14, 9, 26, 10 ]
 */
quicksortDutchFlag(&list, low: 0, high: list.count - 1)
//: [Next](@next)
