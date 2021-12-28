//Sol 1 - T - O(n) S - O(n)

class Solution {
    func closestKValues(_ root: TreeNode?, _ target: Double, _ k: Int) -> [Int] {
        var res = [Int]()

        inorder(root, target, k, &res)

        return res
    }

    fileprivate func inorder(_ node: TreeNode?, _ target: Double, _ k: Int, _ res: inout [Int]) {
        guard let node = node else {
            return
        }

        inorder(node.left, target, k, &res)
        if res.count < k {
            res.append(node.val)
        } else if abs(Double(res.first!) - target) > abs(Double(node.val) - target) {
            res.removeFirst()
            res.append(node.val)
        } else {
            return
        }
        inorder(node.right, target, k, &res)
    }
}


// Sol 2
T - logn+k  S - log n
class Solution {
	func closestKValues(_ root: TreeNode?, _ target: Double, _ k: Int) -> [Int] {
		var ans: [Int] = []
		var succStack: [TreeNode] = []
		var predStack: [TreeNode] = []

		initSuccessorStack(root, target, &succStack)
		initPredecessorStack(root, target, &predStack)

		if succStack.isEmpty, predStack.isEmpty { return [] }

		if !succStack.isEmpty, !predStack.isEmpty, succStack.last!.val == predStack.last!.val {
			getNextPred(from: &predStack)
		}

		for _ in 0..<k {
			if succStack.isEmpty {
				ans.append(getNextPred(from: &predStack))
			} else if predStack.isEmpty {
				ans.append(getNextSucc(from: &succStack))
			} else {
				// If both are not empty
				let succDiff = abs(Double(succStack.last!.val) - target)
				let predDiff = abs(Double(predStack.last!.val) - target)
				ans.append(succDiff < predDiff ? getNextSucc(from: &succStack) : getNextPred(from: &predStack))
			}
		}
		return ans


	}

	// Put all nodes with values >= target into the successor stack
	// ** and ** the smallest possible value >= target is on top of stack
	private func initSuccessorStack(_ root: TreeNode?, _ target: Double, _ successorStack: inout [TreeNode]) {
		var node = root
		while node != nil {
			if Double(node!.val) == target {
				successorStack.append(node!)
				break
			} else if Double(node!.val) > target {
				successorStack.append(node!)
				node = node?.left
			} else {
				// if node.val < target
				node = node?.right
			}
		}
	}

	// Put all nodes with values <= target into the predecessor stack
	// ** and ** the largest possible value <= target is on top of stack
	private func initPredecessorStack(_ root: TreeNode?, _ target: Double, _ predecessorStack: inout [TreeNode]) {
		var node = root
		while node != nil {
			if Double(node!.val) == target {
				predecessorStack.append(node!)
				break
			} else if Double(node!.val) < target {
				predecessorStack.append(node!)
				node = node?.right
			} else {
				node = node?.left
			}
		}
	}

	// Get the next node with value greater than current
	// ** and ** put the smallest possible value >= current on top of the stack
	private func getNextSucc(from succStack: inout [TreeNode]) -> Int {
		var curr = succStack.popLast()
		let ret = curr?.val ?? -1
		curr = curr?.right
		while curr != nil {
			succStack.append(curr!)
			curr = curr?.left
		}
		return ret
	}

	private func getNextPred(from predStack: inout [TreeNode]) -> Int {
		var curr = predStack.popLast()
		let ret = curr?.val ?? -1
		curr = curr?.left
		while curr != nil {
			predStack.append(curr!)
			curr = curr?.right
		}
		return ret
	}
}
