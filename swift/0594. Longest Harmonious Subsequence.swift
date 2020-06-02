// 594. Longest Harmonious Subsequence
// https://leetcode.com/problems/longest-harmonious-subsequence/


class Solution 
{
    func findLHS(_ nums: [Int]) -> Int 
    {
        var hash: [Int: Int] = [:]
        var count = 0
        
        for n in nums
        {
            hash[n] = (hash[n] ?? 0) + 1
            
            if let val = hash[n+1]
            {
                count = max(count, hash[n]! + val)
            }
            
            if let val = hash[n-1]
            {
                count = max(count, hash[n]! + val)
            }
        }
        
        return count
    }
}