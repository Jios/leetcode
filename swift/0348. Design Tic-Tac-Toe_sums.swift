// 348. Design Tic-Tac-Toe
// https://leetcode.com/problems/design-tic-tac-toe/submissions/


class TicTacToe 
{
    var rowSums: [Int]
    var colSums: [Int]
    var diagonalSums: Int = 0
    var antiDiagonalSums: Int = 0
    
    /** Initialize your data structure here. */
    init(_ n: Int) 
    {
        rowSums = [Int](repeating: 0, count: n)
        colSums = [Int](repeating: 0, count: n)
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
        let toAdd = player == 1 ? 1 : -1
        
        rowSums[row] += toAdd
        colSums[col] += toAdd
        
        if row == col 
        {
            diagonalSums += toAdd
        }
        
        if col == colSums.count - row - 1 
        {
            antiDiagonalSums += toAdd
        }
        
        let total = rowSums.count
        
        if abs(rowSums[row]) == total 
            || abs(colSums[col]) == total 
            || abs(diagonalSums) == total 
            || abs(antiDiagonalSums) == total 
        {
            return player
        }
        
        return 0
    }
}