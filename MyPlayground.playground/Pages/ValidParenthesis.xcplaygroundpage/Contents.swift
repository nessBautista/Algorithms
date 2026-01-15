//: [Previous](@previous)

import Foundation

func isValid(_ s: String) -> Bool {
    var map: [Character: Character] = [:]
    var stack:[Character] = []
    map["("] = ")"
    map["{"] = "}"
    map["["] = "]"
    
    for c in s {
        guard map[c] != nil else {
            if let top = stack.last, c == map[top] {
                stack.removeLast()
                continue
            } else {
                return false
            }
        }
        stack.append(c)
    }
    return true
}

print(isValid("([])"))
//: [Next](@next)
