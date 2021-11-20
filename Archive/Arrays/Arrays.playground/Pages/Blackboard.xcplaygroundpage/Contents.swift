//: [Previous](@previous)

import Foundation

func quickSort(_ a: [Int]) -> [Int] {
    guard a.count > 0 else { return a}
    let pivot = a.count / 2
    let less = a.filter({$0 < a[pivot]})
    let equal = a.filter({$0 == a[pivot]})
    let more = a.filter({$0 > a[pivot]})
    
    return quickSort(less) + equal + quickSort(more)
}

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
print(quickSort(list))

