// Rotate Image
// https://leetcode.com/explore/featured/card/top-interview-questions-easy/92/array/770/


class Solution 
{
    func rotate(_ matrix: inout [[Int]]) 
    {
        guard !matrix.isEmpty else {
            return
        }
        
        let n = matrix.count
        
        // transpose matrix
        for i in 0 ..< n
        {
            for j in i ..< n
            {
                (matrix[j][i], matrix[i][j]) = (matrix[i][j], matrix[j][i])
            }
        }
        
        // reverse each row
        for i in 0 ..< n
        {
            for j in 0 ..< n/2
            {
                (matrix[i][n - j - 1], matrix[i][j]) = (matrix[i][j], matrix[i][n - j - 1])
            }
        }
    }
}