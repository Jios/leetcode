// 794. Valid Tic-Tac-Toe State
// https://leetcode.com/problems/valid-tic-tac-toe-state/


class Solution 
{
    func validTicTacToe(_ board: [String]) -> Bool 
    {
        var xCount = 0
        var oCount = 0
        
        for i in 0 ..< board.count
        {
            let row = board[i]
            
            for c in row
            {
                xCount += c == "X" ? 1 : 0
                oCount += c == "O" ? 1 : 0
            }
        }
        
        if xCount != oCount && xCount != oCount + 1
        {
            return false
        }
        
        if isWon(board, "X") && xCount != oCount + 1
        {
            return false
        }
        
        if isWon(board, "O") && xCount != oCount
        {
            return false
        }
        
        return true
    }
    
    private
    func isWon(_ board: [String], _ player: Character) -> Bool
    {
        for i in 0 ..< board.count
        {
            // row
            if board[i][0] == player && board[i][1] == player && board[i][2] == player
            {
                return true
            }
            
            // column
            if board[0][i] == player && board[1][i] == player && board[2][i] == player
            {
                return true
            }
        }
        
        // diagonal
        if board[2][0] == player && board[1][1] == player && board[0][2] == player
        {
            return true
        }
        
        // anti-diagonal
        if board[0][0] == player && board[1][1] == player && board[2][2] == player
        {
            return true
        }
        
        return false
    }
}


extension String
{
    subscript(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}