// Binary Tree Inorder Traversal
// https://leetcode.com/explore/interview/card/microsoft/31/trees-and-graphs/153/


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

 // recursion
 
class Solution 
{
    func inorderTraversal(_ root: TreeNode?) -> [Int] 
    {
        guard let root = root else {
            return []
        }
        
        var values: [Int] = []
        
        values.append(contentsOf: inorderTraversal(root.left))
        values.append(root.val)
        values.append(contentsOf: inorderTraversal(root.right))
        
        return values
    }
}


// iteration

class Solution 
{
    func inorderTraversal(_ root: TreeNode?) -> [Int] 
    {
        guard let root = root else {
            return []
        }
        
        var vals: [Int] = []
        var stack: [TreeNode?] = []
        
        var curr: TreeNode? = root
        
        while curr != nil || !stack.isEmpty
        {
            while curr != nil
            {
                stack.append(curr)
                curr = curr?.left
            }
            
            curr = stack.removeLast()
            
            if let val = curr?.val
            {
                vals.append(val)
            }
            
            curr = curr?.right
        }
        
        return vals
    }
}