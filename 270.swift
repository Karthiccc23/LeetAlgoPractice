

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

T: O(H) S: O(n)
class Solution {
    var res: Int = -1
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var minVal: Double = 10000.00

        findVal(root,&minVal, target)

        return res
    }


    func findVal(_ root: TreeNode?,_ minVal: inout Double,_ target: Double) {
        guard let root = root else { return }

        var currMin = abs(target - Double(root.val))

        if currMin < minVal {
            minVal = currMin
            res = root.val
        }

        minVal = min(currMin, minVal)

        if Double(root.val) > target {
            findVal(root.left,&minVal,target)
        } else {
            findVal(root.right,&minVal,target)
        }
    }
}
