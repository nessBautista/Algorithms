//: [Previous](@previous)

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
	guard nums.count > 0 else {return -1}
	if nums.count == 1 {
		return nums[0] ==  target ? 0 : -1
	}
	
	if nums[0] < nums[nums.count - 1]{
		print("not rotated")
		// it is not rotated
		if let idx = binarySearch(target, nums, low: 0, high: nums.count - 1){
			return idx
		}
	} else {
		// it is rotated
		print("rotated")
		// find k-> where the rotation started
		if let k = findK(nums) {
			print("found k: \(k)")
			let range = (nums[k]...nums[nums.count - 1])
			print(range)
			if range.contains(target){
				print("contains target")
				if let idx = binarySearch(target, nums, low: k, high: nums.count) {
					return idx
				}
			} else {
				if let idx = binarySearch(target, nums, low: 0, high: k - 1) {
					return idx
				}
			}
			
			
		}
		
	}
	return -1
}
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
func findK(_ nums:[Int]) -> Int?{
	var k: Int? = nil
	kBinarySearch(low: 0, high:nums.count)
	
	func kBinarySearch(low: Int, high:Int){
		guard  k == nil else {return}
		guard low <= high else {return}
		let mid = (low  + high) / 2
		//print("mid:\(mid), nums[mid] = \(nums[mid])")
		
		//compare to the right
		if ((mid + 1) < nums.count){
			print("compare right")
			if (nums[mid + 1] < nums[mid]){
				k = mid + 1
				print("found K = \(k)")
				return
			}
		}
		//compare to the left
		if ((mid - 1) >= 0) {
			print("compare left")
			if (nums[mid - 1] > nums[mid]){
				k = mid
				return
			}
		}
		// continue right
		if ((mid + 1) < nums.count){
			kBinarySearch(low: mid+1, high: high)
		}
		//continue left
		if ((mid - 1) >= 0) {
			kBinarySearch(low: low, high: mid - 1)
		}
	}
	return k
}
var nums = [3, 1]
let target = 1

search(nums, target)
print("Done")
let range = 1...1
range.contains(1)
//: [Next](@next)
