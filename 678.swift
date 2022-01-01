
// T- O(n)
class Solution {
    func checkValidString(_ s: String) -> Bool {
   var openStack = [Int]()
	var starStack = [Int]()

	for (index, char) in s.enumerated() {
		if char == "(" {
			openStack.append(index)
		} else if char == "*" {
			starStack.append(index)
		} else {
			if openStack.isEmpty {
				if starStack.isEmpty { // no opens left
					return false
				} else { // use a star as an open
					starStack.popLast()!
				}
			} else { // has an open, pop
				openStack.popLast()!
			}
		}
	}

	while !openStack.isEmpty && !starStack.isEmpty {
		if openStack.popLast()! > starStack.popLast()! {
			return false
		}
	}
	return openStack.isEmpty
    }
}
