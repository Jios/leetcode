// 1029. Two City Scheduling
// https://leetcode.com/problems/two-city-scheduling/solution/


class Solution 
{
    func twoCitySchedCost(_ costs: [[Int]]) -> Int 
    {
        let costs = costs.sorted { ($0[0] - $0[1]) < ($1[0] - $1[1]) }
        
        var total = 0
        
        let half = costs.count / 2
        
        print(costs)
        
        for i in 0 ..< half
        {
            total += costs[i][0] + costs[i + half][1]
        }
        
        return total
    }
}