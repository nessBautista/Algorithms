//: [Previous](@previous)

import Foundation

//var input = [
//  [1,2,3],
//  [4,5,6],
//  [7,8,9]
//]
//
//func rotate(_ matrix: inout [[Int]]) {
//    var N = matrix.count - 1
//    var n = matrix.count - 1 // decreasing
//    var m = 0 // increasing
//
//    for x in 0...n-1 {
//        print(0,m)
//        print(m,N)
//        print(N,n)
//        print(n,0)
//        n -= 1
//        m += 1
//        print("...")
//    }
//}

func getDistance(n1:Int64, n2:Int64)->Int {
    var mask:Int64 = 1
    var count = 0
    
    for x in 1...32 {
        let m1 = n1 & mask
        let m2 = n2 & mask
        count = m1 ^ m2 > 0 ? count + 1 : count
        
        mask = mask << 1
    }
    return count
}

getDistance(n1:93, n2:73)
//: [Next](@next)
