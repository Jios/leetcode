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
                if self.grid[i][j] == "1"
                {
                    count += 1
                    
                    markIsland(i, j)
                }
            }
        }
        
        return count
    }
    
    private func markIsland(_ i: Int, _ j: Int)
    {
        grid[i][j] = "0"
        
        if i-1 >= 0 && grid[i-1][j] == "1"
        {
            markIsland(i-1, j)
        }
        if i+1 < grid.count && grid[i+1][j] == "1"
        {
            markIsland(i+1, j)
        }
        if j-1 >= 0 && grid[i][j-1] == "1"
        {
            markIsland(i, j-1)
        }
        if j+1 < grid[i].count && grid[i][j+1] == "1"
        {
            markIsland(i, j+1)
        }
    }
}

let grid: [[Character]] = [["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]
let result = Solution().numIslands(grid)

print(result)




