import Foundation
let input = [1,2,2,3]
func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
	var output:[[Int]] = []
	var path:[Int] = []
	
	func dfs(_ idx:Int){
		if idx == nums.count{
			output.append(path)
			return
		}
		
		path.append(nums[idx])
		dfs(idx + 1)
		path.popLast()
		var i = idx
		while (i + 1 < nums.count) && (nums[i] == nums[i + 1]){
			i += 1
		}
		dfs(i + 1)
	}
	dfs(0)
	return output
}
let output = subsetsWithDup(input)
print(output)
