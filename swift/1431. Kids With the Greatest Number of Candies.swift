// 1431. Kids With the Greatest Number of Candies
// https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/


class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] 
    {
        var maxCandy = Int.min
        
        for n in candies
        {
            maxCandy = max(maxCandy, n)
        }
        
        var ans = Array(repeating: false, count: candies.count)
        
        for i in 0 ..< candies.count
        {
            ans[i] = (candies[i] + extraCandies) >= maxCandy
        }
        
        return ans
    }
}