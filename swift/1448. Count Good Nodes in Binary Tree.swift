// 1448. Count Good Nodes in Binary Tree
// https://leetcode.com/problems/count-good-nodes-in-binary-tree/


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


class Solution 
{
    func goodNodes(_ root: TreeNode?) -> Int 
    {
        guard let root = root else {
            return 0
        }
        
        return dfs(root, max: root.val)
    }
    
    private 
    func dfs(_ root: TreeNode?, max num: Int) -> Int
    {
        guard let root = root else {
            return 0
        }
        
        var count = 0
        
        if root.val >= num
        {
            count += 1
        }
        
        let m = max(num, root.val)
        
        count += dfs(root.left, max: m)
        count += dfs(root.right, max: m)
        
        return count
    }
}