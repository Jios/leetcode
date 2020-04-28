// 290. Word Pattern
// https://leetcode.com/problems/word-pattern/submissions/


class Solution 
{
    func wordPattern(_ pattern: String, _ str: String) -> Bool 
    {
        var hash: [Character: String] = [:]
        var i = 0
        
        let pattern = Array(pattern)
        let str = str.components(separatedBy: " ")
        
        if pattern.count != str.count
        {
            return false
        }
        
        var set: Set<String> = []
        
        for i in 0 ..< pattern.count
        {
            let c = pattern[i]
            
            if let val = hash[c]
            {
                if val != str[i]
                {
                    return false
                }
            }
            else if set.contains(str[i])
            {
                return false             
            }
            
            hash[c] = str[i]
            set.insert(str[i])
        }
        
        return true
    }
}