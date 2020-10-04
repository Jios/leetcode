// 937. Reorder Data in Log Files
// https://leetcode.com/problems/reorder-data-in-log-files/


class Solution 
{
    func reorderLogFiles(_ logs: [String]) -> [String] 
    {
        var ans: [String] = []
        
        var hash: [String: [String]] = [:]
        var arrDigits: [String] = []
        
        for log in logs
        {
            let (identifier, text) = split(log)
            
            if text[0].isNumber
            {
                arrDigits.append(identifier + " " + text)
            }
            else
            {
                hash[text, default: []].append(identifier)
            }
        }
        
        for dict in hash.sorted(by: { $0.key < $1.key })
        {
            let text = dict.key
            
            for identifier in dict.value.sorted()
            {
                ans.append(identifier + " " + text)
            }
        }
        
        ans.append(contentsOf: arrDigits)
        
        return ans
    }
    
    private 
    func split(_ str: String) -> (String, String)
    {
        var arr = str.components(separatedBy: " ")
        let identifier = arr.removeFirst()
        let text = arr.joined(separator: " ")
        
        return (identifier, text)
    }
}


extension String
{
    subscript(i: Int) -> Character
    {
        return self[index(startIndex, offsetBy: i)]
    }
}