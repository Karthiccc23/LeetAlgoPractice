


class MaxStack {

	// two stack
	// one regular stack
	// one max stack, keep track latest max
	var stack: [Int] = []
	var maxStack: [Int] = []

	init() {

	}

	func push(_ x: Int) {
		stack.append(x)
		maxStack.append(maxStack.isEmpty ? x : max(maxStack.last!, x))
	}

	func pop() -> Int {
		maxStack.removeLast()
		return stack.removeLast()
	}

	func top() -> Int {
		return stack.last!
	}

	func peekMax() -> Int {
		return maxStack.last!
	}

	func popMax() -> Int {
		let max = maxStack.last!
		var tmp: [Int] = []
		while let lastItem = stack.popLast() {

			maxStack.removeLast()
			if lastItem == max {
				print("removed:",lastItem)
				break
			} else {
				tmp.append(lastItem)
			}
		}

		while let lastItem = tmp.popLast() {
			self.push(lastItem)
		}

		return max
	}
}
