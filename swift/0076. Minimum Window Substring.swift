// 76. Minimum Window Substring
// https://leetcode.com/problems/minimum-window-substring/


/*
Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

Example:

Input: S = "ADOBECODEBANC", T = "ABC"
Output: "BANC"
Note:

If there is no such window in S that covers all characters in T, return the empty string "".
If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
*/


class Solution {
    func minWindow(_ s: String, _ t: String) -> String
    {
        guard s.count >= t.count else {
            return ""
        }
        
        let s = Array(s)
        
        var start = 0, end = 0
        
        var answer = ""
        
        var hashS: [Character: Int] = [:]
        var hashT: [Character: Int] = [:]
        
        for c in t
        {
            hashT[c] = (hashT[c] ?? 0) + 1
        }

        // let c = s.char(end)
        let c = s[end]
        
        hashS[c] = 1

        while end < s.count
        {
            // print("\(start),\(end)")
                        
            if start <= end && checkCount(hashS, hashT) // containSubstring(s, start, end, t)
            {
                if answer.isEmpty || end - start < answer.count
                {
                    let startIdx = s.index(s.startIndex, offsetBy: start)
                    let endIdx   = s.index(s.startIndex, offsetBy: end)
                    
                    let range = startIdx ... endIdx
                    
                    answer = String(s[range])
                }
                
                // let c = s.char(start)
                let c = s[end]
                hashS[c] = (hashS[c] ?? 0) - 1
                
                start += 1
            }
            else
            {
                end += 1
                
                if end < s.count
                {
                    // let c = s.char(end)
                    let c = s[end]
                    hashS[c] = (hashS[c] ?? 0) + 1
                }
            }
        }
        
        return answer
    }
    
    private func checkCount(_ hashS: [Character: Int], _ hashT: [Character: Int]) -> Bool
    {
        guard hashS.keys.count >= hashT.keys.count else {
            return false
        }
        
        for c in Array(hashT.keys)
        {
            if (hashS[c] ?? Int.min) < hashT[c]!
            {
                return false
            }
        }
        
        return true
    }
}


extension String
{
    func char(_ offset: Int) -> Character
    {
        let idx = index(startIndex, offsetBy: offset)
        return self[idx]
    }
}
