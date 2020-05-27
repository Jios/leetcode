// Best Time to Buy and Sell Stock II
// https://leetcode.com/explore/featured/card/top-interview-questions-easy/92/array/564/


class Solution {
    func maxProfit(_ prices: [Int]) -> Int 
    {
        guard !prices.isEmpty else {
            return 0
        }
        
        var ans = 0
        
        for i in 1 ..< prices.count
        {
            if prices[i] > prices[i-1]
            {
                ans += prices[i] - prices[i-1]
            }
        }
        
        return ans
    }
}