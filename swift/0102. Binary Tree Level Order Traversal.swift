// 102. Binary Tree Level Order Traversal
// https://leetcode.com/problems/binary-tree-level-order-traversal/


class Solution 
{
    func levelOrder(_ root: TreeNode?) -> [[Int]] 
    {
        guard let root = root else {
            return []
        }
        
        var queue: [TreeNode] = [root]
        var ans: [[Int]] = []
        
        while !queue.isEmpty
        {
            var nodes: [TreeNode] = []
            var vals: [Int] = []
            
            for node in queue
            {
                vals.append(node.val)
                
                if let left = node.left
                {
                    nodes.append(left)
                }
                if let right = node.right
                {
                    nodes.append(right)
                }
            }
            
            ans.append(vals)
            queue = nodes
        }
        
        return ans
    }
}





/*
class Solution 
{
    func levelOrder(_ root: TreeNode?) -> [[Int]] 
    {
        guard let root = root else {
            return []
        }
        
        var levels: [[Int]] = []
        var stack: [(Int, TreeNode)] = [(0, root)]
        
        while !stack.isEmpty
        {
            var (i, node) = stack.removeFirst()
            
            if levels.indices.contains(i)
            {
                levels[i].append(node.val)
            }
            else
            {
                levels.append([node.val])
            }
            
            if let left = node.left
            {
                stack.append((i+1, left))
            }
            
            if let right = node.right
            {
                stack.append((i+1, right))
            }
        }
        
        return levels
    }
}
// */