// 1512. Number of Good Pairs
// https://leetcode.com/problems/number-of-good-pairs/


class Solution 
{
    func numIdenticalPairs(_ nums: [Int]) -> Int 
    {
        var ans = 0
        var hash: [Int: Int] = [:]
        
        for i in 0 ..< nums.count
        {
            let n = nums[i]
            
            hash[n, default: 0] += 1
        }
        
        for n in hash.values
        {
            ans += n * (n - 1) / 2
        }
        
        return ans
    }
}