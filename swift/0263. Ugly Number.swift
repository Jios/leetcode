// 263. Ugly Number
// https://leetcode.com/problems/ugly-number/


class Solution 
{
    func isUgly(_ num: Int) -> Bool 
    {
        if num < 1 {
            return false
        }
        
        var n = num
        for i in [2, 3, 5] {
            while n % i == 0 {
                n /= i
            }
        }
        
        return (n == 1)
    }
}