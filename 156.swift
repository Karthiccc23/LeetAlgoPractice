class Solution {
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        if (root == nil || root?.left == nil) {
            return root;
        }

        let newRoot = upsideDownBinaryTree(root?.left);
        root?.left?.left = root?.right;
        root?.left?.right = root;
        root?.left = nil;
        root?.right = nil;
        return newRoot;
    }
}
