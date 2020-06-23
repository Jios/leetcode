// 559. Maximum Depth of N-ary Tree
// https://leetcode.com/problems/maximum-depth-of-n-ary-tree/


/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution 
{
    func maxDepth(_ root: Node?) -> Int 
    {
        guard let root = root else {
            return 0
        }
        
        var queue = [root]
        var depth = 0
        
        while !queue.isEmpty
        {
            let nodes = queue
            queue.removeAll()
            
            for node in nodes
            {
                queue.append(contentsOf: node.children)
            }
            
            depth += 1
        }
        
        return depth
    }
}