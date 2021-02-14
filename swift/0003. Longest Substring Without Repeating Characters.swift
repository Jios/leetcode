// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/


class Solution
{
    func lengthOfLongestSubstring(_ s: String) -> Int
    {
        let s = Array(s)
        var set: Set<Character> = []
        var ans = 0
        var i = 0, j = 0
        
        while i < s.count && j < s.count
        {
            if !set.contains(s[j])
            {
                set.insert(s[j])
                j += 1
                ans = max(ans, j - i)
            }
            else
            {
                set.remove(s[i])
                i += 1
            }
            
        }
        
        return ans
    }
}

/*
class Solution
{
    func lengthOfLongestSubstring(_ s: String) -> Int
    {
        var count = 0
        var hash: [Character : Int] = [:]
        
        for (idx, c) in s.enumerated()
        {
            count = max(hash.keys.count, count)
            
            if let index = hash[c]
            {
                hash = hash.filter { index < $0.value }
                // hash.removeValue(forKey: c)
            }
            
            hash[c] = idx
        }
        
        count = max(hash.keys.count, count)
        
        return count
    }
}
// */