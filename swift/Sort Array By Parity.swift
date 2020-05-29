// Sort Array By Parity
// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3260/


class Solution 
{
    func sortArrayByParity(_ A: [Int]) -> [Int] 
    {
        var ans = Array(repeating: 0, count: A.count)
        var even = 0, odd = ans.count - 1
        
        for i in 0 ..< A.count
        {
            if A[i] % 2 == 0
            {
                ans[even] = A[i]
                even += 1
            }
            else
            {
                ans[odd] = A[i]
                odd -= 1
            }
        }
        
        return ans
    }
}