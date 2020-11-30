// 348. Design Tic-Tac-Toe
// https://leetcode.com/problems/design-tic-tac-toe/submissions/


class TicTacToe
{
    var board: [[Int]]
    var n: Int
    
    /** Initialize your data structure here. */
    init(_ n: Int) 
    {
        self.n = n
        board = Array(repeating: Array(repeating: 0, count: n), count: n)
    }
    
    /** Player {player} makes a move at ({row}, {col}).
        @param row The row of the board.
        @param col The column of the board.
        @param player The player, can be either 1 or 2.
        @return The current winning condition, can be either:
                0: No one wins.
                1: Player 1 wins.
                2: Player 2 wins. */
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int 
    {
        board[row][col] = player
        
        // horizontal
        var count = 0
        for i in 0 ..< self.n
        {
            if board[row][i] != player
            {
                break
            }
            
            count += 1
        }
        
        if count == self.n
        {
            return player
        }
        
        // vertical
        count = 0
        for i in 0 ..< self.n
        {
            if board[i][col] != player
            {
                break
            }
            
            count += 1
        }
        
        if count == self.n
        {
            return player
        }
        
        //diagonal
        if row + col == self.n - 1 || row == col
        {
            count = 0
            for i in 0 ..< self.n
            {
                if board[i][self.n - i - 1] != player
                {
                    break
                }

                count += 1
            }

            if count == self.n
            {
                return player
            }
            
            count = 0
            for i in 0 ..< self.n
            {
                if board[i][i] != player
                {
                    break
                }

                count += 1
            }

            if count == self.n
            {
                return player
            }
        }
        
        return 0
    }
}

/**
 * Your TicTacToe object will be instantiated and called as such:
 * let obj = TicTacToe(n)
 * let ret_1: Int = obj.move(row, col, player)
 */