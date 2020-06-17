// 5453. Running Sum of 1d Array
// https://leetcode.com/problems/running-sum-of-1d-array/


class Solution 
{
    func runningSum(_ nums: [Int]) -> [Int] 
    {
        guard !nums.isEmpty else {
            return []
        }
        
        var ans: [Int] = Array(repeating: nums[0], count: nums.count)
        
        for i in 1 ..< nums.count
        {
            ans[i] = ans[i-1] + nums[i]
        }
        
        return ans
    }
}