// 917. Reverse Only Letters
// https://leetcode.com/problems/reverse-only-letters/


class Solution 
{
    func reverseOnlyLetters(_ S: String) -> String 
    {
        var s = Array(S)
        
        var left = 0, right = s.count - 1
        
        while left < right
        {
            if s[left].isLetter && s[right].isLetter
            {
                (s[left], s[right]) = (s[right], s[left])
                
                left += 1
                right -= 1
            }
            else if !s[left].isLetter 
            {
                left += 1
            }
            else
            {
                right -= 1
            }
        }
        
        return String(s)
    }
}