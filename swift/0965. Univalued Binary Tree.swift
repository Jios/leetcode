// 965. Univalued Binary Tree
// https://leetcode.com/problems/univalued-binary-tree/


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
class Solution {
    func isUnivalTree(_ root: TreeNode?) -> Bool 
    {
        guard let root = root else {
            return true
        }
        
        var queue: [TreeNode] = [root]
        let val = root.val
        
        while !queue.isEmpty
        {
            let node = queue.removeFirst()
            
            if node.val != val
            {
                return false
            }
            
            if let left = node.left
            {
                queue.append(left)
            }
            if let right = node.right
            {
                queue.append(right)
            }
        }
        
        return true
    }
}