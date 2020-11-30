// 79. Word Search
// https://leetcode.com/problems/word-search/


class Solution 
{
    var board: [[Character]] = []
    var nr = 0, nc = 0
    var word: String = ""
    
    func exist(_ board: [[Character]], _ word: String) -> Bool 
    {
        guard !board.isEmpty else {
            return false
        }
        
        self.board = board
        nr = board.count
        nc = board[0].count
        self.word = word
        
        for r in 0 ..< nr
        {
            for c in 0 ..< nc
            {
                if dfs(r, c, 0)
                {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool
    {
        if i == self.word.count
        {
            return true
        }
        
        if r < 0 || r >= nr || c < 0 || c >= nc || self.board[r][c] != self.word[i]
        {
            return false
        }
        
        // modify character
        self.board[r][c] = "#"
        
        for (rOffset, cOffset) in [(0, 1), (1, 0), (0, -1), (-1, 0)]
        {
            if dfs(r + rOffset, c + cOffset, i + 1)
            {
                return true
            }
        }
        
        // resume character
        self.board[r][c] = self.word[i]
        
        return false
    }
}


extension String
{
    subscript(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}