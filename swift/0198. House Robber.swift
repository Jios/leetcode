// 198. House Robber
// https://leetcode.com/problems/house-robber/


class Solution 
{
    func rob(_ nums: [Int]) -> Int 
    {
        var prevMax = 0
        var currMax = 0
        
        for num in nums
        {
            let tmp = currMax
            currMax = max(prevMax + num, currMax)
            prevMax = tmp
        }
        
        return currMax
    }
}