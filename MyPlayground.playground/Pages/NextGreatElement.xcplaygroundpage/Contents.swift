//: [Previous](@previous)
//This monotonic stack pattern also solves:
//- Next Greater Element
//- Largest Rectangle in Histogram
//- Trapping Rain Water
import Foundation
let nums1 = [4,1,2]
 let nums2 = [1,3,4,2,5]

func nextGreatElement(_ nums1:[Int], _ nums2: [Int]) -> [Int] {
    var stack:[Int] = []
    var map:[Int: Int] = [:]
    for n in nums2 {
        while !stack.isEmpty && n > stack.last! {
            let pop = stack.removeLast()
            map[pop] = n
        }
        stack.append(n)
    }
    
    for (key,val) in map {
        print("The next great after \(key) is \(val)")
    }
    return nums1.map { map[$0] ?? -1}
}

nextGreatElement(nums1, nums2)
//: [Next](@next)
