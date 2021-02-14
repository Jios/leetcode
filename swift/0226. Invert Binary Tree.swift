// 226. Invert Binary Tree
// https://leetcode.com/problems/invert-binary-tree/


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
class Solution 
{
    func invertTree(_ root: TreeNode?) -> TreeNode? 
    {
        invert(root)
        
        return root
    }
    
    private func invert(_ root: TreeNode?)
    {
        if root == nil
        {
            return
        }
        
        let left = root?.left
        root?.left = root?.right
        root?.right = left
        
        invert(root?.left)
        invert(root?.right)
    }
}