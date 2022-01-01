
// T - O(n)
func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        let pDepth = depth(p); let qDepth = depth(q)
        var lowerNode = pDepth > qDepth ? p : q
        var higherNode = pDepth > qDepth ? q : p
        var depthDiff = abs(pDepth - qDepth)
        while depthDiff > 0 {
            depthDiff -= 1
            lowerNode = lowerNode?.parent
        }

        while lowerNode !== higherNode {
            lowerNode = lowerNode?.parent
            higherNode = higherNode?.parent
        }
        
        return lowerNode
    }

    private func depth(_ node: Node?) -> Int {
        var depth = 0
        var node = node
        while node?.parent != nil {
            node = node?.parent
            depth += 1
        }
        return depth
    }



// T - O(h1+h2) Two runners
class Solution {
    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        var runner1 = p
        var runner2 = q

        while (runner1 !== runner2) { // Guaranteed to complete since both nodes belong to same tree
            // We are simulating a cycle when any of the conditions below is satisfied
            // by pointing runner to the head of the other "list"  to make sure
            // intersection is found before either of the below conditions are satisfied again
            runner1 = (runner1 == nil) ? q : runner1?.parent
            runner2 = (runner2 == nil) ? p : runner2?.parent
        }

        return runner1
    }
}
