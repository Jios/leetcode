// 36. Valid Sudoku
// https://leetcode.com/problems/valid-sudoku/


class Solution 
{
    func isValidSudoku(_ board: [[Character]]) -> Bool 
    {
        for r in 0 ..< board.count
        {
            if !isValid(r...r, 0...board[r].count-1, board)
            {
                return false
            }
        }
        
        for c in 0 ..< board[0].count
        {
            if !isValid(0...board.count-1, c...c, board)
            {
                return false
            }
        }
        
        for r in stride(from: 0, to: board.count-1, by: 3)
        {
            for c in stride(from: 0, to: board[r].count-1, by: 3)
            {
                if !isValid(r...r+2, c...c+2, board)
                {
                    return false
                }
            }
        }
        
        return true
    }
    
    private
    func isValid(_ rows: ClosedRange<Int>, 
                 _ cols: ClosedRange<Int>,
                 _ board: [[Character]]) -> Bool
    {
        var hash: [Int: Int] = [:]
        
        for r in rows
        {
            for c in cols
            {
                let c = board[r][c]
                
                if c == "."
                {
                    continue
                }
                else if let val = c.wholeNumberValue
                {
                    let count = (hash[val] ?? 0) + 1
                    
                    if count > 1
                    {
                        return false
                    }
                    
                    hash[val] = count
                }
            }
        }
        
        return true
    }
}