// 70. Climbing Stairs
// https://leetcode.com/problems/climbing-stairs/


class Solution 
{
    var memo: [Int: Int] = [:]
    
    func climbStairs(_ n: Int) -> Int 
    {
        if let val = memo[n]
        {
            return val
        }
        else if n <= 2
        {
            return n
        }
        
        let result = climbStairs(n - 1) + climbStairs(n - 2)
        memo[n] = result
        
        return result
    }
}