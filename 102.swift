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

 T - O(N) S- O(N)
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        bfs(root,&res)

        return res
    }

    func bfs(_ root: TreeNode?,_ res: inout [[Int]]) {
        guard let root = root else { return }

        var queue = [TreeNode]()

        queue.append(root)

        while !queue.isEmpty {
            var arr = [Int]()
            var count = queue.count
            for idx in 0..<count {
                var node = queue.removeFirst()

                arr.append(node.val)

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }

            res.append(arr)
        }
    }
}
