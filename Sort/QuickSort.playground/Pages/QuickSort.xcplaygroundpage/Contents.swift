import UIKit

var greeting = "Hello, playground"

func quickSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else { return input }
    let pivot_idx = input.count / 2
    let pivot = input[pivot_idx]
    var left:[Int] = []
    var right:[Int] = []
    
    var i = 0
    while i < input.count {
        if i != pivot_idx {
            if input[i] <= pivot {
                left.append(input[i])
            } else {
                right.append(input[i])
            }
        }
        i += 1
    }
    return quickSort(left) + [pivot] + quickSort(right)
    
}

let ranNumbers : [Int] = (0...99).map({_ in .random(in: 1...20)})
let numbers: [Int] = [1,5,3,4,2,7,10,20,15]
let sorted = quickSort(ranNumbers)

print(sorted)
