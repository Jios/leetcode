// 1306. Jump Game III
// https://leetcode.com/problems/jump-game-iii/


class Solution 
{
    func canReach(_ arr: [Int], _ start: Int) -> Bool 
    {
        // var arr = arr
        var visited: [Bool] = [Bool](repeating: false, count: arr.count)
        var queue: [Int] = [start]
        
        while !queue.isEmpty
        {
            let idx = queue.removeFirst()
            let val = arr[idx]
            
            if val == 0
            {
                return true
            }
            
            visited[idx] = true
            
            let preIdx = idx - val
            let nextIdx = idx + val
            
            // right
            if nextIdx < arr.count && !visited[nextIdx]
            {
                queue.append(nextIdx)
            }
            
            // left
            if preIdx >= 0 && !visited[preIdx]
            {
                queue.append(preIdx)
            }
        }
        
        return false
    }
}