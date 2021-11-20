//: [Previous](@previous)

import Foundation
/*

a = [[1, 2, 3],
     [4, 5, 6],
     [7, 8, 9]]

rotateImage(a) =
    [[7, 4, 1],
     [8, 5, 2],
     [9, 6, 3]]

swap-> [idy][idx],  [][]

*/
func rotate(_ a: inout [[Int]]) {
  guard a.isEmpty == false else { return  }
  let size = a.count - 1
 
  for i in 0..<(a.count/2) {
    for j in i..<size-i {
      
      var temp = a[i][j]
      a[i][j] = a[size-j][i]
      a[size-j][i] = a[size-i][size-j]
      a[size-i][size-j] = a[j][size-i]
      a[j][size-i] = temp
    }
  }
}

func printArray(_ a:[[Int]]){
  let size = a.count - 1
  for i in 0...size {
    var s = String()
    for j in 0...size {
      s.append("\(a[i][j]) ")
    }
    print(s)
  }
}

var a1 = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]]
var a2 = [[1,2,3], [4,5,6], [7,8,9]]
rotate(&a1)
printArray(a1)
//: [Next](@next)
