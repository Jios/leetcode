// 490. The Maze
// https://leetcode.com/problems/the-maze/


class Solution 
{
    var cols = 0
    var rows = 0
    
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool 
    {
        var maze = maze
        
        rows = maze.count
        cols = maze[0].count
        
        return dfs(&maze, start, destination)
    }
    
    private
    func dfs(_ maze: inout [[Int]], _ start: [Int], _ dest: [Int]) -> Bool
    {
        let row = start[0]
        let col = start[1]
        
        if maze[row][col] == -1
        {
            return false
        }
        
        if row == dest[0] && col == dest[1]
        {
            return true
        }
        
        maze[row][col] = -1
        
        // left
        var idx = col
        while idx - 1 >= 0 && maze[row][idx - 1] != 1 { idx -= 1}
        if dfs(&maze, [row, idx], dest) { return true }
        
        // right
        idx = col
        while idx + 1 < cols && maze[row][idx + 1] != 1 { idx += 1}
        if dfs(&maze, [row, idx], dest) { return true }
        
        
        // up
        idx = row
        while idx - 1 >= 0 && maze[idx - 1][col] != 1 { idx -= 1}
        if dfs(&maze, [idx, col], dest) { return true }
        
        // down
        idx = row
        while idx + 1 < rows && maze[idx + 1][col] != 1 { idx += 1}
        if dfs(&maze, [idx, col], dest) { return true }
        
        return false
    }
}