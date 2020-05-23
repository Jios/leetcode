// 680. Valid Palindrome II
// https://leetcode.com/problems/valid-palindrome-ii/


class Solution 
{
    func validPalindrome(_ s: String) -> Bool 
    {
        return helper(Array(s), 
                      0,
                      s.count - 1, 
                      false)
    }
    
    private func helper(_ s: [Character],
                        _ left: Int,
                        _ right: Int,
                        _ hasDeleted: Bool) -> Bool
    {
        var left = left
        var right = right
        
        while left < right
        {
            if s[left] != s[right]
            {
                if !hasDeleted
                {
                    return helper(s, left + 1, right, true) || helper(s, left, right - 1, true)
                }
                else
                {
                    return false
                }
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}