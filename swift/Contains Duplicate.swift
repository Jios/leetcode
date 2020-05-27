// Contains Duplicate
// https://leetcode.com/explore/featured/card/top-interview-questions-easy/92/array/578/


class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool 
    {
        var set: Set<Int> = []
        
        for n in nums
        {
            if set.contains(n)
            {
                return true
            }
            
            set.insert(n)
        }
        
        return false
    }
}

/*
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool 
    {
        var hash: [Int: Int] = [:]
        
        for n in nums
        {
            let count = (hash[n] ?? 0) + 1
            
            if count > 1
            {
                return true
            }
            
            hash[n] = count
        }
        
        return false
    }
}
*/