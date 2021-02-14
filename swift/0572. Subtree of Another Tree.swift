// 572. Subtree of Another Tree
// https://leetcode.com/problems/subtree-of-another-tree/


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
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool 
    {
        return traverse(s, t)
    }
    
    private func traverse(_ s: TreeNode?, 
                          _ t: TreeNode?) -> Bool
    {
        return s != nil
            && (isEqual(s, t) 
                || traverse(s?.left, t)
                || traverse(s?.right, t))
    }
    
    private func isEqual(_ s: TreeNode?, 
                         _ t: TreeNode?) -> Bool
    {
        if s == nil && t == nil 
        {
            return true
        }
        else if s == nil || t == nil
        {
            return false
        }
        
        return s?.val == t?.val 
            && isEqual(s?.left, t?.left) 
            && isEqual(s?.right, t?.right)
    }
}