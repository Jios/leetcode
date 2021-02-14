// 100. Same Tree
// https://leetcode.com/problems/same-tree/


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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool 
    {
        return dfs(p, q)
    }
    
    private func dfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool 
    {
        if p == nil && q == nil 
        {
            return true
        }
        
        if p?.val != q?.val
        {
            return false
        }
        
        return dfs(p?.left, q?.left) && dfs(p?.right, q?.right)
    }
}



// bfs

/*
class Solution 
{
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool 
    {
        if !isEqual(p, q)
        {
            return false
        }
        
        var queueP: [TreeNode?] = [p]
        var queueQ: [TreeNode?] = [q]
        
        while !queueP.isEmpty
        {
            let p = queueP.removeFirst()
            let q = queueQ.removeFirst()
            
            if !isEqual(p, q)
            {
                return false
            }
            
            if p != nil
            {
                if !isEqual(p?.left, q?.left)
                {
                    return false
                }
                
                queueP.append(p?.left)
                queueQ.append(q?.left)
                
                
                if !isEqual(p?.right, q?.right)
                {
                    return false
                }
                
                queueP.append(p?.right)
                queueQ.append(q?.right)
            }
        }
        
        return true
    }
    
    private
    func isEqual(_ p: TreeNode?, _ q: TreeNode?) -> Bool 
    {
        if p == nil && q == nil
        {
            return true
        }
        if p == nil || q == nil
        {
            return false
        }
        
        return p!.val == q!.val
    }
}
// */