// 59. Spiral Matrix II
// https://leetcode.com/problems/spiral-matrix-ii/


class Solution 
{
    func generateMatrix(_ n: Int) -> [[Int]]
    {
        var ans: [[Int]] = Array(repeating: Array(repeating: 0, count: n),
                                 count: n)
        
        // [row, col]
        let dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        let range = (0 ..< n)
        
        var r = 0
        var c = 0
        var i = 1
        var idxDir = 0
        
        while i <= n * n
        {
            ans[r][c] = i
            i += 1
            
            // boundary check
            var dir = dirs[idxDir]
            
            let dr = r + dir[0]
            let dc = c + dir[1]
            
            if !range.contains(dr) || !range.contains(dc)
                || ans[dr][dc] != 0
            {
                // change direction
                idxDir = (idxDir + 1) % 4
                dir = dirs[idxDir]
            }
            
            r += dir[0]
            c += dir[1]
        }
        
        return ans
    }
}
