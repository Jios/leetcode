// 200. Number of Islands
// https://leetcode.com/problems/number-of-islands/


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
                    bfs(i, j, &grid)
                }
            }
        }
        
        return count
    }
    
    
    private
    func bfs(_ i: Int, _ j: Int, _ grid: inout [[Character]])
    {
        grid[i][j] = "0"
        
        var queue: [(Int, Int)] = [(i, j)]
        
        while !queue.isEmpty
        {
            var coord = queue.removeLast()
            
            if coord.0 - 1 >= 0 && grid[coord.0 - 1][coord.1] == "1"
            {
                queue.append((coord.0 - 1, coord.1))
                grid[coord.0 - 1][coord.1] = "0"
            }
            
            if coord.0 + 1 < grid.count && grid[coord.0 + 1][coord.1] == "1"
            {
                queue.append((coord.0 + 1, coord.1))
                grid[coord.0 + 1][coord.1] = "0"
            }
            
            if coord.1 - 1 >= 0 && grid[coord.0][coord.1 - 1] == "1"
            {
                queue.append((coord.0, coord.1 - 1))
                grid[coord.0][coord.1 - 1] = "0"
            }
            
            if coord.1 + 1 < grid[coord.0].count && grid[coord.0][coord.1 + 1] == "1"
            {
                queue.append((coord.0, coord.1 + 1))
                grid[coord.0][coord.1 + 1] = "0"
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
