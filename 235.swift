/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */


T - O(N)
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if let val = root?.val, val > p!.val && val > q!.val {
            return lowestCommonAncestor(root?.left, p, q)
        } else if let val = root?.val, val < p!.val && val < q!.val {
            return lowestCommonAncestor(root?.right, p, q)
        } else {
            return root
        }
    }
}
