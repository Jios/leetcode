// 1573. Number of Ways to Split a String
// https://leetcode.com/problems/number-of-ways-to-split-a-string/


class Solution 
{
    func numWays(_ s: String) -> Int 
    {
        var count = 0
        
        for c in s
        {
            if c == "1"
            {
                count += 1
            }
        }
        
        if count == 0
        {
            return (s.count - 1) * (s.count - 2) / 2 % (Int(pow(Double(10), Double(9))) + 7)
        }
        else if count % 3 != 0
        {
            return 0
        }
        
        var l = 0
        var r = 0
        var countOne = 0
        
        let t1 = count / 3
        let t2 = t1 * 2
        
        for c in s
        {
            if c == "1"
            {
                countOne += 1
            }
            
            if countOne == t1
            {
                l += 1
            }
            else if countOne == t2
            {
                r += 1
            }
        }
        
        return (l * r) % (Int(pow(Double(10), Double(9))) + 7)
    }
}