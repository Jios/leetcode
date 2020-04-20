// 409. Longest Palindrome
// https://leetcode.com/problems/longest-palindrome/


// Manacher's Algorithm
// https://www.hackerrank.com/topics/manachers-algorithm


class Solution 
{
    func longestPalindrome(_ s: String) -> String 
    {
        guard s.count > 1 else {
            return s
        }
        
        var str = ""
        
        for i in 0 ..< s.count 
        {
            let idx = String.Index(encodedOffset: i)
            str.append(String(s[idx]))
            str.append("#")
        }
        
        var p: [Int] = [1]
        var ct = 0         // 中心位置
        var mr = 1         // 回文字串的最大右边界
        
        var chars = [Character](str)
        
        
        for i in 1 ..< str.count 
        {
            let val = mr > i ? min(p[2 * ct - i], mr-i) : 1  // p[i]的值为其对称的值p[j]和右边界到i的值的最小值
            p.append(val)
            
            // 如果对称位置的字符相等则加1
            while i-p[i] >= 0
                && i+p[i] < chars.count
                && chars[i-p[i]] == chars[i+p[i]] 
            {
                p[i] += 1
            }
            
            // 更新中心位置和最大右边界位置
            if i + p[i] > mr 
            {
                mr = i + p[i]
                ct = i
            }
        }
        
        if let val = p.max() 
        {
            let index = p.index(of: val)
            let start = String.Index(encodedOffset: index!-val+1)
            let end = String.Index(encodedOffset: index!+val)

            return String(str[start ..< end]).replacingOccurrences(of: "#", with: "")
        }
        
        return ""
    }
}