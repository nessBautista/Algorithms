import UIKit

//Delete repeated numbers from a sorted array
//[2,3,5,5,7,11,11,11,13] -> [2,3,5,7,11,0,0,0]

func swap(i:Int, j:Int, array: inout [Int]) {
    let length = array.count - 1
    guard i < length || j < length else {
        return
    }
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}

func swipeToEnd(idx:Int, array: inout [Int]){
    let length = array.count - 1
    var id1 = idx
    var id2 = idx + 1
    
    guard id1 < length || id2 < length else {
        return
    }
    
    while id2 <= length {
        
        swap(i: id1, j: id2, array: &array)
        id1 += 1
        id2 += 1
    }
    
}


func deleteRepeatedValues(array: inout [Int]) {
    guard array.count > 0  else {return}
    
    var id1 = 0
    var id2 = 1
    
    while id2 < array.count {
        if array[id1] == array[id2] && (array[id1] + array[id2] != 0){
            array[id2] = 0
            swipeToEnd(idx: id2, array: &array)
            print(array)
        } else {
            id1 += 1
            id2 += 1
        }
    }
}

var input = [2,2,3,5,5,7,11,11,11,13]

deleteRepeatedValues(array: &input)


func quicksort(array:inout [Int]){
    quicksortHelper(array: &array, left: 0, right: array.count - 1)
}

func quicksortHelper(array:inout [Int], left:Int, right:Int) {
    guard left < right else {return}
    let pivot = array[Int((left+right) / 2)]
    let idx = partition(array: &array, left: left, right: right, pivot: pivot)
    quicksortHelper(array: &array, left: left, right: idx - 1)
    quicksortHelper(array: &array, left: idx, right: right)
}

func partition(array:inout [Int], left:Int, right:Int, pivot:Int)->Int {
    var left = left
    var right = right
    while left <= right {
        while array[left] < pivot {
            left += 1
        }
        while array[right] > pivot {
            right -= 1
        }
        if left <= right{
            swap(i: left, j: right, array: &array)
            left += 1
            right -= 1
        }
    }
    return left
}

input = [3,1,4,7,7,11,8,6,15,14]
quicksort(array: &input)
print(input)
