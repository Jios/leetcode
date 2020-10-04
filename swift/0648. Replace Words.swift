// 648. Replace Words
// https://leetcode.com/problems/replace-words/


class Solution 
{
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String 
    {
        var ans: [String] = []
        
        let dictionary = dictionary.sorted(by: { $0.count < $1.count})
        
        for word in sentence.components(separatedBy: " ")
        {
            var foundRoot = false
            
            for root in dictionary
            {
                if word.hasPrefix(root)
                {
                    ans.append(root)
                    foundRoot = true
                    break
                }
            }
            
            if !foundRoot
            {
                ans.append(word)
            }
        }
        
        return ans.joined(separator: " ")
    }
}