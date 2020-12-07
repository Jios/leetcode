// 885. Spiral Matrix III
// https://leetcode.com/problems/spiral-matrix-iii/


class Solution 
{
    func spiralMatrixIII(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] 
    {
        var ans: [[Int]] = [[r0, c0]]
        var i = 0, r = r0, c = c0
        
        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]
        
        while ans.count < R*C
        {
            let d = i % 4
            for _ in 0 ..< (i/2 + 1)
            {
                r += dr[d]
                c += dc[d]
                
                if r < 0 || r >= R || c < 0 || c >= C
                {
                    continue
                }
                
                ans.append([r, c])
            }
            i += 1
        }
        
        return ans
    }
    
//     func spiralMatrixIII(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] 
//     {
//         var ans: [[Int]] = [[r0, c0]]
//         var r0 = r0
//         var c0 = c0
        
//         for k in stride(from: 1, to: 2*(R+C), by: 2)
//         {
//             for (dr, dc, dk) in [(0, 1, k), (1, 0, k), (0, -1, k+1), (-1, 0, k+1)]
//             {
//                 for i in 0 ..< dk
//                 {
//                     r0 += dr
//                     c0 += dc
                    
//                     if 0 <= r0 && r0 < R 
//                     && 0 <= c0 && c0 < C
//                     {
//                         ans.append([r0, c0])
//                         if ans.count == R*C
//                         {
//                             return ans
//                         }
//                     }
//                 }
//             }
//         }
        
//         return ans
//     }
}