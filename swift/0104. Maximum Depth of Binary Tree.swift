// 104. Maximum Depth of Binary Tree
// https://leetcode.com/problems/maximum-depth-of-binary-tree/


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


// bfs
class Solution
{
    func maxDepth(_ root: TreeNode?) -> Int 
    {
        guard let root = root else {
            return 0
        }
        
        var ans = 0
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty
        {
            ans += 1
            
            var nodes: [TreeNode] = []
            
            for node in queue
            {
                if let left = node.left
                {
                    nodes.append(left)
                }
                if let right = node.right
                {
                    nodes.append(right)
                }
            }
            
            queue = nodes
        }
        
        return ans
    }
}


// dfs
/*
class Solution
{
    func maxDepth(_ root: TreeNode?) -> Int 
    {
        return maxDepth(root, depth: 0)
    }
    
    func maxDepth(_ root: TreeNode?, depth: Int) -> Int 
    {
        if root == nil 
        {
            return depth
        }
        
        let leftDepth = maxDepth(root?.left, depth: depth+1)
        let rightDepth = maxDepth(root?.right, depth: depth+1)
        
        return max(leftDepth, rightDepth)
    }
}
// */