// 557. Reverse Words in a String III
// https://leetcode.com/problems/reverse-words-in-a-string-iii/


class Solution 
{
    func reverseWords(_ s: String) -> String 
    {
        var arr = s.components(separatedBy: " ")
        
        for i in 0 ..< arr.count
        {
            var arrStrs = Array(arr[i])
            
            var l = 0, r = arrStrs.count - 1
            while l < r
            {
                (arrStrs[l], arrStrs[r]) = (arrStrs[r], arrStrs[l])
                l += 1
                r -= 1
            }
            
            arr[i] = String(arrStrs)
        }
        
        return arr.joined(separator: " ")
    }
}