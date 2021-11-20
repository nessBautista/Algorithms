import Foundation

// lomuto: left side receive values less than pivot
func lomuto<T:Comparable>(_ a:inout [T], low:Int, high: Int) -> Int {
	let pivot = a[high]
	var i = low
	
	for j in 0..<high {
		if a[j] <= pivot {
			a.swapAt(i,j)
			i += 1
		}
	}
	//You've reach the end, values less or equal shoud be in place now
	//[<--values less than pivot-->][i]....[high]
	a.swapAt(i, high)
	return i
} 

func quickSort<T:Comparable>(_ a: inout [T], low: Int, high: Int) {
	if low < high {
		let p = lomuto(&a, low: low, high: high)
        quickSort(&a, low: low, high: p - 1)
        quickSort(&a, low: p + 1, high: high)
	}
}
var list = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]
print(quickSort(&list, low: 0, high: list.count - 1))
