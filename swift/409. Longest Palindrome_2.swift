// 409. Longest Palindrome
// https://leetcode.com/problems/longest-palindrome/


class Solution
{
    func longestPalindrome(_ s: String) -> String
    {
        guard !s.isEmpty else {
            return ""
        }
        
        let arrS = Array(s)
        
        var startInd = 0
        var endInd = 0
        
        for i in 0 ..< s.count
        {
            let len1 = expandAroundCenter(arrS, leftInd: i, rightInd: i)
            let len2 = expandAroundCenter(arrS, leftInd: i, rightInd: i+1)
            let len = max(len1, len2)
            
            if len > endInd - startInd
            {
                print("\(i): ")
                
                startInd = i - (len - 1) / 2
                endInd = i + len / 2
                
                print(">>> \(len) -> [\(startInd), \(endInd)]")
            }
        }
        
        let sIndex = s.index(s.startIndex, offsetBy: startInd)
        let eIndex = s.index(s.startIndex, offsetBy: endInd)
        
        return String(s[sIndex ... eIndex])
    }
    
    
    private func expandAroundCenter(_ arrS: [String.Element],
                                    leftInd: Int,
                                    rightInd: Int) -> Int
    {
        var leftInd = leftInd
        var rightInd = rightInd
        
        while leftInd >= 0
            , rightInd < arrS.count
            , arrS[leftInd] == arrS[rightInd]
        {
            leftInd  -= 1
            rightInd += 1
        }
        
        print(">>> [\(leftInd), \(rightInd)]")
        
        return rightInd - leftInd - 1
    }
}

let s = Solution()
s.longestPalindrome("babad")
print("---------")
s.longestPalindrome("cbbd")
