// 1295. Find Numbers with Even Number of Digits
// https://leetcode.com/problems/find-numbers-with-even-number-of-digits/


class Solution {
    func findNumbers(_ nums: [Int]) -> Int 
    {
        var ans = 0
        
        for i in 0 ..< nums.count
        {
            var n = nums[i]
            var count = 0
            
            while n > 0 
            {
                let digit = n % 10
                n /= 10
                count += 1
            }
            
            if count % 2 == 0
            {
                ans += 1
            }
        }
        
        return ans
    }
}