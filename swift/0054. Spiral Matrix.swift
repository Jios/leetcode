54. Spiral Matrix
https://leetcode.com/problems/spiral-matrix/


class Solution
{
    func spiralOrder(_ matrix: [[Int]]) -> [Int]
    {
        guard !matrix.isEmpty else {
            return []
        }
        
        var ans: [Int] = []
        var r1 = 0, c1 = 0
        var r2 = matrix.count - 1, c2 = matrix[0].count - 1
        
        while r1 <= r2 && c1 <= c2
        {
            for c in c1 ... c2
            {
                let n = matrix[r1][c]
                ans.append(n)
            }
            
            r1 += 1
            
            if r1 <= r2
            {
                for r in r1 ... r2
                {
                    print(r)
                    let n = matrix[r][c2]
                    ans.append(n)
                }
            }
            
            c2 -= 1
            
            if r1 <= r2
            {
                var c = c2
                while c >= c1
                {
                    let n = matrix[r2][c]
                    ans.append(n)

                    c -= 1
                }
            }
            
            r2 -= 1
            
            if c1 <= c2
            {
                var r = r2
                while r >= r1
                {
                    let n = matrix[r][c1]
                    ans.append(n)

                    r -= 1
                }
            }
            
            c1 += 1
        }
        
        return ans
    }
    
    
    
//     let dirs: [[Int]] = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    
//     func spiralOrder(_ matrix: [[Int]]) -> [Int]
//     {
//         guard !matrix.isEmpty else {
//             return []
//         }
        
//         var ans: [Int] = []
//         var maxR = matrix.count, maxC = matrix[0].count
//         var minR = 0, minC = 0
//         var r = 0, c = 0
//         var i = 0
        
//         while ans.count <= (maxR * maxC)
//         {
//             let dir = dirs[i % 4]
//             let dr = dir[0]
//             let dc = dir[1]
            
//             while minR <= r && r < maxR && minC <= c && c < maxC
//             {
//                 let n = matrix[r][c]
//                 print("n = \(n)")
                
//                 ans.append(n)
                
//                 r += dr
//                 c += dc
//             }
            
//             i += 1
            
//             minR += abs(dr)
//             maxR -= abs(dr)
            
//             minC += abs(dc)
//             maxC -= abs(dc)
            
//             r = min(r, maxR - 1)
//             r = max(r, minR)
//             c = min(c, maxC - 1)
//             c = max(c, minC)
//             print("count = \(ans.count)")
//         }
        
//         return ans
//     }
    }


// MARK: - with dirs and boundary checks
/*
class Solution
{
    func spiralOrder(_ matrix: [[Int]]) -> [Int]
    {
        var ans: [Int] = []
        let dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        let numRs = matrix.count
        let numCs = matrix[0].count
        var rangeR = (0 ..< numRs)
        var rangeC = (0 ..< numCs)
        var count = 0
        var r = 0
        var c = 0
        var d = 0
        
        
        while count < numRs * numCs
        {
            let n = matrix[r][c]
            ans.append(n)
            count += 1
            
            var dir = dirs[d]
            let dr = r + dir[0]
            let dc = c + dir[1]
            
            if !rangeR.contains(dr) || !rangeC.contains(dc)
            {
                if d == 0
                {
                    // top
                    rangeR = (rangeR.lowerBound + 1 ..< rangeR.upperBound)
                }
                else if d == 1
                {
                    // right
                    rangeC = (rangeC.lowerBound ..< rangeC.upperBound - 1)
                }
                else if d == 2
                {
                    // bottom
                    rangeR = (rangeR.lowerBound ..< rangeR.upperBound - 1)
                }
                else
                {
                    // left
                    rangeC = (rangeC.lowerBound + 1 ..< rangeC.upperBound)
                }
                
                d = (d + 1) % 4
                dir = dirs[d]
            }
            
            r += dir[0]
            c += dir[1]
        }
        
        return ans
    }
}
*/