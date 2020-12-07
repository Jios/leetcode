// 200. Number of Islands
// https://leetcode.com/problems/number-of-islands/


class Solution {
    func numIslands(_ grid: [[Character]]) -> Int 
    {
        var ans = 0
        var grid = grid
        
        for i in 0 ..< grid.count
        {
            for j in 0 ..< grid[i].count
            {
                if grid[i][j] == Character("1")
                {
                    ans += 1
                    dfs(&grid, i, j)
                }
            }
        }
        
        return ans
    }
    
    private 
    func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int)
    {
        if i < 0 || i >= grid.count || j < 0 || j >= grid[0].count
            || grid[i][j] == "0"
        {
            return
        }
        
        grid[i][j] = "0"
        
        dfs(&grid, i - 1, j)
        dfs(&grid, i + 1, j)
        dfs(&grid, i, j - 1)
        dfs(&grid, i, j + 1)
    }
}

let grid: [[Character]] = [["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]
let result = Solution().numIslands(grid)

print(result)



/*
class Solution
{
    func numIslands(_ grid: [[Character]]) -> Int
    {
        var grid = grid
        var count = 0
        
        for i in 0 ..< grid.count
        {
            for j in 0 ..< grid[i].count
            {
                if grid[i][j] == "1"
                {
                    count += 1
                    
                    dfs(i, j, &grid)
                }
            }
        }
        
        return count
    }
    
    private func dfs(_ i: Int, _ j: Int, _ grid: inout [[Character]])
    {
        grid[i][j] = "0"
        
        if i-1 >= 0 && grid[i-1][j] == "1"
        {
            dfs(i-1, j, &grid)
        }
        if i+1 < grid.count && grid[i+1][j] == "1"
        {
            dfs(i+1, j, &grid)
        }
        if j-1 >= 0 && grid[i][j-1] == "1"
        {
            dfs(i, j-1, &grid)
        }
        if j+1 < grid[i].count && grid[i][j+1] == "1"
        {
            dfs(i, j+1, &grid)
        }
    }
}
*/