import UIKit



func isValidParentheses(_ s: String) -> Bool{
	var stack:[Character] = []
	guard !s.isEmpty else {return false}
	guard let first = s.first, !isTarget(first, isClosed: true) else {return false}
	
	for char in s {
		if isTarget(char, isClosed: false){
			//append open characters: {([
			stack.append(char)
		} else {
			if let last = stack.last,
			   arePairs(c1: last, c2: char) {
				stack.popLast()
			} else {
				return false
			}
		}
	}
	
	return stack.isEmpty
}
func arePairs(c1:Character, c2:Character) -> Bool {
	return (c1 == "{" && c2 == "}") || (c1 == "[" && c2 == "]") || (c1 == "(" && c2 == ")")
}
func isTarget(_ c:Character, isClosed: Bool) ->Bool {
	switch c{
	case "{":
		return isClosed ? false : true
	case "(":
		return isClosed ? false : true
	case "[":
		return isClosed ? false : true
	case "}":
		return isClosed ? true : false
	case ")":
		return isClosed ? true : false
	case "]":
		return isClosed ? true : false
	default:
		return false
	}
}

let s = "{({}))[][[[]]]}"

isValidParentheses(s)
