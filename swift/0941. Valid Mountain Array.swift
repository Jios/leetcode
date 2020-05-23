// 941. Valid Mountain Array
// https://leetcode.com/problems/valid-mountain-array/


class Solution 
{
    func validMountainArray(_ A: [Int]) -> Bool 
    {
        guard A.count >= 3 else {
            return false
        }
        
        var ans = true
        
        var i = 0
        
        // check increasing
        while i < A.count-1 && A[i] < A[i+1]
        {
            i += 1
        }
        
        if i == 0 || i == A.count-1
        {
            return false
        }
        
        // check decreasing 
        while i < A.count-1 && A[i] > A[i+1]
        {
            i += 1
        }
        
        if i != A.count-1
        {
            return false
        }
        
        return true
    }
}