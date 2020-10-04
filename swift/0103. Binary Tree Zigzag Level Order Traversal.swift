
// 103. Binary Tree Zigzag Level Order Traversal
// https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/


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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] 
    {
        guard let root = root else {
            return []
        }
        
        var queue: [TreeNode] = [root]
        var ans: [[Int]] = []
        var isLeftOrder = true
        
        while !queue.isEmpty
        {
            var vals: [Int] = []
            
            var nodes = queue
            queue.removeAll()
            
            for node in nodes
            {
                if isLeftOrder
                {
                    vals.append(node.val)
                }
                else
                {
                    vals.insert(node.val, at: 0)
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
            
            isLeftOrder.toggle()
            
            ans.append(vals)
        }
        
        return ans
    }
}