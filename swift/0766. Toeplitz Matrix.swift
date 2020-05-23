// 766. Toeplitz Matrix
// https://leetcode.com/problems/toeplitz-matrix/


class Solution 
{
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool 
    {
        for i in 0 ..< matrix.count
        {
            var r = i, c = 0
            let value = matrix[r][c]
            
            while r < matrix.count && c < matrix[0].count
            {
                if value != matrix[r][c]
                {
                    return false
                }
                
                r += 1
                c += 1
            }
        }
        
        for i in 1 ..< matrix[0].count
        {
            var r = 0, c = i
            let value = matrix[r][c]
            
            while r < matrix.count && c < matrix[0].count
            {
                if value != matrix[r][c]
                {
                    return false
                }
                
                r += 1
                c += 1
            }
        }
        
        return true
    }
}