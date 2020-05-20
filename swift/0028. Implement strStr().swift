// 28. Implement strStr()
// https://leetcode.com/problems/implement-strstr/


class Solution 
{
    func strStr(_ haystack: String, _ needle: String) -> Int 
    {
        if haystack == needle || needle.isEmpty 
        {
            return 0
        }
        else if haystack.count < needle.count
        {
            return -1
        }
        
        let haystack = Array(haystack)
        let needle = Array(needle)
        
        var i = 0
        let end = haystack.count - needle.count
        
        while i <= end
        {
            var idxH = i
            var idxN = 0
            
            while haystack[idxH] == needle[idxN]
            {
                if idxN == needle.count - 1
                {
                    return i
                }
                
                idxH += 1
                idxN += 1
            }
            
            i += 1
        }
        
        return -1
    }
}