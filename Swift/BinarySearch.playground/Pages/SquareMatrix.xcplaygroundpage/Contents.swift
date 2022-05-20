import UIKit

// what is divided is not the array, but the indexes you are searching for
func binarySearch(_ target:Int, _ array: [Int], low:Int, high:Int)-> Int? {
	// base case
	if low > high {
		return nil
	}
	let mid = Int(Double((low + high) / 2).rounded(.down))
	let guess = array[mid]
	//print(guess)
	if guess == target {
		return mid
	} else  if target < guess  {
		return binarySearch(target, array, low: low, high: mid - 1)
	} else {
		return binarySearch(target, array, low: mid + 1, high: high)
	}
}
let numbers = [2,4,8,20,50,51,70]
if let targetIdx = binarySearch(51, numbers, low:0, high:numbers.count - 1) {
	print(targetIdx)
}


let array = [[ 1, 3, 5, 7],
			 [10,11,16,20],
			 [23,30,34,60]]
let target = 3

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
	let n = matrix.count
	//find row
	var row = 0
	for i in 0..<n{
		if target == matrix[i][0] {
			return true
		}
		if target < matrix[i][0]{
			row = i - 1
			break
		}
		if i == (n-1){
			let col = matrix[n-1].count - 1
			row = target <= matrix[n-1][col] ? n-1 : -1
		}
			
	}
	
	if row >= 0 {
		if let idx = binarySearch(target, matrix[row], low: 0, high: matrix[row].count - 1){
			return true
		}
	}
	return false
}
