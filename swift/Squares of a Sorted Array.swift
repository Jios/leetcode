// Squares of a Sorted Array
// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3261/


class Solution 
{
    func sortedSquares(_ A: [Int]) -> [Int] 
    {
        guard !A.isEmpty else {
            return A
        }
        
        var ans: [Int] = Array(repeating: 0, count: A.count)
        
        var r = 0
        
        while r < A.count && A[r] < 0
        {
            r += 1
        }
        
        var l = r - 1
        var i = 0 
        
        while l >= 0 && r < A.count
        {
            let lVal = A[l] * A[l]
            let rVal = A[r] * A[r]
            
            if lVal < rVal
            {
                ans[i] = lVal
                l -= 1
            }
            else
            {
                ans[i] = rVal
                r += 1
            }
            
            i += 1
        }
        
        while l >= 0 
        {
            print(l)
            
            ans[i] = A[l] * A[l]
            l -= 1
            i += 1
        }
        
        while r < A.count
        {
            ans[i] = A[r] * A[r]
            r += 1
            i += 1
        }
        
        return ans
    }
}