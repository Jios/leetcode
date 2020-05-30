// 867. Transpose Matrix
// https://leetcode.com/problems/transpose-matrix/


class Solution 
{
    func transpose(_ A: [[Int]]) -> [[Int]] 
    {
        guard !A.isEmpty else {
            return A
        }
        
        var a = Array(repeating: Array(repeating: 0, count: A.count), 
                      count: A[0].count)
        
        for r in 0 ..< A.count
        {
            for c in 0 ..< A[r].count
            {
                a[c][r] = A[r][c]
            }
        }
        
        return a
    }
}