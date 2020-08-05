//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


func nationFlag(array:inout [Int], pivotIdx:Int) {
    var small_idx = 0
    let pivot = array[pivotIdx]
    for (idx, item) in array.enumerated() {
        if item < pivot {
            swap(idx, small_idx,a:&array)
            small_idx += 1
        }
    }
    print(array)
    var large_idx = array.count - 1
    for (idx, item) in array.enumerated().reversed(){

        guard item >= pivot else {return}
        if item > pivot {
            swap(idx, large_idx,a:&array)
            large_idx -= 1
        }
    }
}

func swap(_ idx1:Int, _ idx2:Int, a:inout [Int]){
    guard idx1 != idx2 else {return}
    let temp = a[idx1]
    a[idx1] = a[idx2]
    a[idx2] = temp
}

var input = [5,13,1,6,5,4,8,2,9,0, 5]
nationFlag(array:&input, pivotIdx:0)
print(input)
//: [Next](@next)
