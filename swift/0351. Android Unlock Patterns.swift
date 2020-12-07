// 351. Android Unlock Patterns
// https://leetcode.com/problems/android-unlock-patterns/


class Solution
{
    let hash: [String: Int] = ["1-3": 2,
                               "1-7": 4,
                               "1-9": 5,
                               "2-8": 5,
                               
                               "3-1": 2,
                               "3-7": 5,
                               "3-9": 6,
                               "4-6": 5,
                               
                               "6-4": 5,
                               "7-1": 4,
                               "7-3": 5,
                               "7-9": 8,
                               
                               "8-2": 5,
                               "9-1": 5,
                               "9-3": 6,
                               "9-7": 8]
    
    func numberOfPatterns(_ m: Int, _ n: Int) -> Int
    {
        var ans = 0
        
        var visited = Set<Int>()
        
        for len in m ... n
        {
            visited.insert(1)
            ans += dfs(1, len - 1, visited) * 4
            visited.remove(1)
            
            visited.insert(2)
            ans += dfs(2, len - 1, visited) * 4
            visited.remove(2)
            
            visited.insert(5)
            ans += dfs(5, len - 1, visited)
        }
        
        return ans
    }
    
    private
    func dfs(_ curr: Int,
             _ remain: Int,
             _ visited: Set<Int>) -> Int
    {
        if remain == 0
        {
            return 1
        }
        
        var count = 0
        
        for next in 1 ... 9
        {
            if isValid(curr, next, visited)
            {
                count += dfs(next, remain - 1, visited.union([next]))
            }
        }
        
        return count
    }
    
    private
    func isValid(_ curr: Int,
                 _ next: Int,
                 _ visited: Set<Int>) -> Bool
    {
        let hashVal = hash["\(curr)-\(next)"] ?? -1
        
        if !visited.contains(next) && (hashVal == -1 || visited.contains(hashVal))
        {
            return true
        }
        
        return false
    }
}

/*
class Solution
{
    let hash: [String: Int] = ["1-3": 2,
                               "1-7": 4,
                               "1-9": 5,
                               "2-8": 5,
                               
                               "3-1": 2,
                               "3-7": 5,
                               "3-9": 6,
                               "4-6": 5,
                               
                               "6-4": 5,
                               "7-1": 4,
                               "7-3": 5,
                               "7-9": 8,
                               
                               "8-2": 5,
                               "9-1": 5,
                               "9-3": 6,
                               "9-7": 8]
    
    func numberOfPatterns(_ m: Int, _ n: Int) -> Int
    {
        var ans = 0
        
        for len in m ... n
        {
            for i in 1 ... 9
            {
                let visited: Set = [i]
                ans += dfs(i, len - 1, visited)
            }
        }
        
        return ans
    }
    
    private
    func isValid(_ curr: Int,
                 _ next: Int,
                 _ visited: Set<Int>) -> Bool
    {
        let hashVal = hash["\(curr)-\(next)"] ?? -1
        
        if !visited.contains(next) && (hashVal == -1 || visited.contains(hashVal))
        {
            return true
        }
        
        return false
    }
    
    private
    func dfs(_ curr: Int,
             _ remain: Int,
             _ visited: Set<Int>) -> Int
    {
        if remain == 0
        {
            return 1
        }
        
        var count = 0
        
        for next in 1 ... 9
        {
            if isValid(curr, next, visited)
            {
                count += dfs(next, remain - 1, visited.union([next]))
            }
        }
        
        return count
    }
}
// */