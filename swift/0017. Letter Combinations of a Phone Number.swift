// 17. Letter Combinations of a Phone Number
// https://leetcode.com/problems/letter-combinations-of-a-phone-number/


class Solution 
{
    var ans: [String] = []
    var digits: [Character] = []
    let hash: [Character: [String]] = ["2": ["a", "b", "c"],
                                       "3": ["d", "e", "f"],
                                       "4": ["g", "h", "i"],
                                       "5": ["j", "k", "l"],
                                       "6": ["m", "n", "o"],
                                       "7": ["p", "q", "r", "s"],
                                       "8": ["t", "u", "v"],
                                       "9": ["w", "x", "y", "z"]]
    
    func letterCombinations(_ digits: String) -> [String] 
    {
        guard !digits.isEmpty else {
            return []
        }
        
        self.digits = Array(digits)
        
        dfs(0, "")
        
        return ans
    }
    
    private 
    func dfs(_ i: Int, _ str: String)
    {
        guard i < digits.count else {
            ans.append(str)
            return
        }
        
        let c = digits[i]
        
        if let arr = hash[c]
        {
            for ch in arr
            {
                dfs(i + 1, str + String(ch))
            }
        }
    }
}