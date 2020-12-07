// 1578. Minimum Deletion Cost to Avoid Repeating Letters
// https://leetcode.com/problems/minimum-deletion-cost-to-avoid-repeating-letters/


class Solution 
{
    func minCost(_ s: String, _ cost: [Int]) -> Int 
    {
        let s = Array(s)
        var ans = 0
        
        var i = 0
        while i < s.count
        {
            let c = s[i]
            
            var totalCost = cost[i]
            var maxCost = cost[i]
            
            var j = i + 1
            
            while j < s.count && c == s[j]
            {
                maxCost = max(maxCost, cost[j])
                totalCost += cost[j]
                j += 1
            }
            
            i = j
            
            ans += totalCost - maxCost
        }
        
        return ans
    }
}