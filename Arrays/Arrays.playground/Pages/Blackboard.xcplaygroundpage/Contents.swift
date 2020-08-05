//: [Previous](@previous)

import Foundation

func swap(i:Int, j:Int, array: inout[Int]){
    guard i != j else {return}
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}

func quickSort_helper(array: inout[Int], left:Int, right:Int){
    guard left < right else {return}
    let pivot = array[Int((left + right)/2)]
    let idx = partition(array: &array, left: left, right: right, pivot: pivot)
    quickSort_helper(array: &array, left: left, right: idx - 1)
    quickSort_helper(array: &array, left: idx, right: right)
}

func partition(array: inout[Int], left:Int, right:Int, pivot:Int) -> Int{
    var left = left
    var right = right
    while left <= right {
        while array[left] < pivot {
            left += 1
        }
        
        while array[right] > pivot{
            right -= 1
        }
        
        if left <= right {
            swap(i: left, j: right, array: &array)
            left += 1
            right -= 1
        }
    }
    return left
}

func quickSort(array: inout[Int]) {
    quickSort_helper(array: &array, left: 0, right: array.count - 1)
}

var input = [2,3,1,4,1,7,3,7,8,9,11]
quickSort(array: &input)
print(input)


