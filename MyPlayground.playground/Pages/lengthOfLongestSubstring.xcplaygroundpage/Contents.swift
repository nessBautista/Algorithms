//: [Previous](@previous)

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
        var response = 0
        var left = 0
        var right = 0
        var set: Set<Character> = []
        
        while right < s.count {
            guard !set.contains(s[safe: right]!) else {
                set.remove(s[safe: left]!)
                left += 1
                continue
            }
            set.insert(s[safe: right]!)
            right += 1
        
            response = max(response, (right - left))
        }
    
    return response
}


extension StringProtocol {
    subscript(safe offset: Int) -> Character? {
        guard offset >= 0,
              let idx = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else {
            return nil
        }
        return self[idx]
    }
}

lengthOfLongestSubstring("abcabcbb")


//: [Next](@next)
