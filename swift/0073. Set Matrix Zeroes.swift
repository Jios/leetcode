// 73. Set Matrix Zeroes
// https://leetcode.com/problems/set-matrix-zeroes/


class Solution 
{
    func setZeroes(_ matrix: inout [[Int]]) 
    {
        var isCol = false
        
        for r in 0 ..< matrix.count
        {
            if matrix[r][0] == 0
            {
                isCol = true
            }
            
            for c in 1 ..< matrix[r].count
            {
                if matrix[r][c] == 0
                {
                    matrix[r][0] = 0
                    matrix[0][c] = 0
                }
            }
        }
        
        for r in 1 ..< matrix.count
        {
            for c in 1 ..< matrix[r].count
            {
                if matrix[r][0] == 0 || matrix[0][c] == 0
                {
                    matrix[r][c] = 0
                }
            }
        }
        
        if matrix[0][0] == 0
        {
            for c in 0 ..< matrix[0].count
            {
                matrix[0][c] = 0
            }
        }
        
        if isCol
        {
            for r in 0 ..< matrix.count
            {
                matrix[r][0] = 0
            }
        }
    }
}