// 230. Kth Smallest Element in a BST
// https://leetcode.com/problems/kth-smallest-element-in-a-bst/solution/


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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int 
    {
        var root = root
        var k = k
        var stack: [TreeNode] = []
        
        while true
        {
            while let node = root
            {
                stack.append(node)
                root = node.left
            }
            
            let node = stack.removeLast()
            k -= 1
            
            if k == 0
            {
                return node.val
            }
            
            root = node.right
        }
    }
}