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

 // T - O(N) S - O(N)
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        var maxDepth = Int.min

        findDepth(root,1,&maxDepth)

        return maxDepth == Int.min ? 0 : maxDepth
    }

    func findDepth(_ root: TreeNode?, _ depth: Int,_ maxDepth: inout Int) {
        guard let root = root else { return }


        maxDepth = max(depth,maxDepth)

        findDepth(root.left,depth+1,&maxDepth)
        findDepth(root.right,depth+1,&maxDepth)
    }
}
