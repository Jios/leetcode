// 289. Game of Life
// https://leetcode.com/problems/game-of-life/

class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        var result: [[Int]] = []
        
        var cur = 0
        // var nxt = 0
        
        let rowCount = board.count
        let colCount = board[0].count
        
        // if rowCount
        
        var sum: Int
        
        for i in 0..<rowCount {
            result.append([])
            
            for j in 0..<colCount {
                sum = 0
                
                cur = board[i][j]
                // print("current (\(i),\(j)) \nval=\(board[i][j])")
                for x in max(0,i-1)...min(rowCount-1,i+1) {
                    for y in max(0,j-1)...min(colCount-1,j+1) {
                        if x != i || y != j {
                            sum = sum + board[x][y]
                            // print("(\(x),\(y)),val=\(board[x][y])")
                        }
                    }
                }
                // print("sum=\(sum)")
                if sum < 2 {
                    result[i].append(0)
                    // print("less 2")
                    continue
                } 
                if sum < 3 {
                    result[i].append(cur)
                    // print("less 3")
                    continue
                }
                if sum == 3 {
                    result[i].append(1)
                    continue
                }
                // nxt = (cur==0) ? 1:0
                // print("nxt=\(nxt)")
                result[i].append(0)
                continue
            }
        }
        
        
        board = result
    }
}