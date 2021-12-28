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


T- O(n) S- O(n)
class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var nodes = [String]()

        func helper(_ node: TreeNode?) {
            guard let node = node else {
                nodes.append("nil")
                return
            }

            nodes.append(String(node.val))
            helper(node.left)
            helper(node.right)
        }

        helper(root)
        return nodes.joined(separator: ",")
    }

    func deserialize(_ data: String) -> TreeNode? {
        let nodes = data.split(separator: ",").map { Int(String($0)) }
        var idx = 0

        func helper() -> TreeNode? {
            guard let val = nodes[idx] else {
                idx += 1
                return nil
            }

            idx += 1
            let node = TreeNode(val)
            node.left = helper()
            node.right = helper()
            return node
        }

        return helper()
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
