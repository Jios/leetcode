// 1202. Smallest String With Swaps
// https://leetcode.com/problems/smallest-string-with-swaps/


class Solution 
{    
    // build graph with adjacent list using pairs
    // run dfs to get all the indices and indicesChar in the same group
    // - dfs(indices, indicesChar, graph, visited, chars, pos)
    // sort indices and indicesChar in the same group
    // replace all the characters in the indices with sorted indicesChar in the same group
    
    func smallestStringWithSwaps(_ s: String, 
                                 _ pairs: [[Int]]) -> String 
    {
        let n = s.count
        var graph = Array(repeating: [Int](), count: n)
        
        for pair in pairs 
        {
            graph[pair[0]].append(pair[1])
            graph[pair[1]].append(pair[0])
        }
        
        var visited = Array(repeating: false, count: n)
        var s = Array(s)

        for i in 0 ..< s.count 
        {
            if visited[i] == false 
            {
                continue
            }

            var indices = [Int]()
            var indicesChar = [Character]()

            dfs(&indices, &indicesChar, &graph, s, i, &visited)
            
            indices.sort()
            indicesChar.sort()
            
            for j in 0 ..< indices.count 
            {
                s[indices[j]] = indicesChar[j] 
            }
        }

        return String(s)
    }
    
    private 
    func dfs(_ indices: inout [Int], 
             _ indicesChar: inout [Character], 
             _ graph: inout [[Int]], 
             _ s: [Character], 
             _ pos: Int, 
             _ visited: inout [Bool]) 
    {
        guard visited[pos] == false else {
            return
        }
        
        visited[pos] = true
        
        indices.append(pos)
        indicesChar.append(s[pos])

        for nextPos in graph[pos] 
        {
            dfs(&indices, &indicesChar, &graph, s, nextPos, &visited)
        }
    }
}