// 669. Trim a Binary Search Tree
// https://leetcode.com/problems/trim-a-binary-search-tree/


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
    var L = 0, R = 0
    
    func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? 
    {
        guard let root = root else {
            return nil
        }
        
        self.L = L
        self.R = R
        
        return traverse(root)
    }
    
    private
    func traverse(_ node: TreeNode?) -> TreeNode?
    {
        guard var node = node else {
            return nil
        }
        
        if node.val > R
        {
            return traverse(node.left)
        }
        else if node.val < L
        {
            return traverse(node.right)
        }

        node.left = traverse(node.left)
        node.right = traverse(node.right)

        return node
    }
}