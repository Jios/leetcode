// 819. Most Common Word
// https://leetcode.com/problems/most-common-word/


class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String 
    {
        var ans = ""
        var maxCount = Int.min
        var hash: [String: Int] = [:]
        let banned = Set(banned)
        var words = paragraph.lowercased().split{ !$0.isLetter }
        
        for word in words
        {
            let word = String(word)
            
            if banned.contains(word)
            {
                continue
            }
            
            let count = (hash[word] ?? 0) + 1
            hash[word] = count
            
            if count > maxCount
            {
                maxCount = count
                ans = word
            }
        }
        
        return ans
    }
}