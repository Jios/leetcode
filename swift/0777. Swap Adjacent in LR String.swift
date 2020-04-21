// 777. Swap Adjacent in LR String
// https://leetcode.com/problems/swap-adjacent-in-lr-string/


class Solution 
{
    func canTransform(_ start: String, _ end: String) -> Bool 
    {
        if start.replacingOccurrences(of: "X", with: "") != end.replacingOccurrences(of: "X", with: "")
        {
            return false
        }
        
        var i = 0, j = 0
        let count = start.count
        
        let start = Array(start)
        let end = Array(end)
        
        while i < count && j < count
        {
            while i < count && start[i] == "X"
            {
                i += 1
            }
            
            while j < count && end[j] == "X"
            {
                j += 1
            }
            
            if i < count && start[i] == "L" && i < j
            {
                return false
            }
            
            if j < count && end[j] == "R" && i > j
            {
                return false
            }
            
            i += 1
            j += 1
        }
        
        return true
    }
}