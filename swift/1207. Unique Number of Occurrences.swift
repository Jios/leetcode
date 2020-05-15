// 1207. Unique Number of Occurrences
// https://leetcode.com/problems/unique-number-of-occurrences/


class Solution 
{
    func uniqueOccurrences(_ arr: [Int]) -> Bool 
    {
        var hash: [Int: Int] = [:]
        
        for n in arr
        {
            hash[n] = (hash[n] ?? 0) + 1
        }
        
        var set: Set<Int> = []
        
        for val in hash.values
        {
            if set.contains(val)
            {
                return false
            }
            
            set.insert(val)
        }
        
        return true
    }
}