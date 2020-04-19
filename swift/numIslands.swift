class Solution 
{
    var grid: [[Character]] = []

    func numIslands(_ grid: [[Character]]) -> Int 
    {
        self.grid = grid

        var count = 0
        
        for i in 0 ..< self.grid.count
        {
            for j in 0 ..< self.grid[i].count
            {
                if self.grid[i][j] == Character("1")
                {
                    count += 1
                    
                    markIsland(i, j)

                    print(self.grid)
                }
            }
        }
        
        return count
    }
    
    private func markIsland(_ i: Int, _ j: Int)
    {
        grid[i][j] = Character("0")
        
        for r in [max(0, i-1), min(grid.count-1, i+1)]
        {
            for c in [max(0, j-1), min(grid[i].count-1, j+1)]
            {
                if grid[r][c] == Character("1")
                {
                    markIsland(r, c)
                }
            }
        }
    }
}


let grid: [[Character]] = 
[["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]
// print(grid)

let s = Solution()
let r = s.numIslands(grid)
print(r)
