//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func quickSort(array: inout [Int]){
    quickSort_helper(array: &array, left: 0, right: array.count - 1)
}

func quickSort_helper(array: inout [Int], left:Int, right:Int){
    guard array.count > 0 else {return}
    guard left < right else {return}
    
    let pivot = array[ Int((left + right)/2)]
    let idx = partition(array: &array, left: left, right: right, pivot: pivot)
    
    //Do recursion
    quickSort_helper(array: &array, left: left, right: idx - 1)
    quickSort_helper(array: &array, left: idx, right: right)
}

func partition(array: inout [Int], left:Int, right:Int, pivot:Int)-> Int {
    var left = left
    var right = right
    while left <= right {
        
        while array[left] < pivot {
            left += 1
        }
        while array[right] > pivot {
            right -= 1
        }
        if left <= right {
            swap(i: left, j: right, a: &array)
            left += 1
            right -= 1
        }
    }
    return left
}

func swap(i:Int, j:Int, a: inout [Int]) {
    guard i != j else {return}
    let temp = a[i]
    a[i] = a[j]
    a[j] = temp
}

var a = [4,1,6,3,7,3,9,0,2]
quickSort(array: &a)
print(a)
//: [Next](@next)
