// 1262. Greatest Sum Divisible by Three
// https://leetcode.com/problems/greatest-sum-divisible-by-three/

class Solution 
{
    func maxSumDivThree(_ nums: [Int]) -> Int 
    {
        let n = nums.count
        
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), 
                                count: n + 1)
        
        for i in 1 ... n
        {
            for j in 0 ..< 3
            {
                dp[i][j] = dp[i-1][j]
                
                let t = (j - nums[i-1] % 3 + 3) % 3
                
                if dp[i-1][t] != 0 || nums[i-1] % 3 == j
                {
                    dp[i][j] = max(dp[i][j], dp[i-1][t] + nums[i-1])
                }
            }
        }
        
        return dp[n][0]
    }
}


let s = Solution().maxSumDivThree([3,6,5,1,8])
print(s)