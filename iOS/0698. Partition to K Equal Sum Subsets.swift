// 698. Partition to K Equal Sum Subsets
// https://leetcode.com/problems/partition-to-k-equal-sum-subsets/


class Solution
{
    var target = Int.min
    var nums: [Int] = []
    
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool
    {
        self.nums = nums
        
        let total = self.nums.reduce(0, +)
        
        if total % k > 0
        {
            return false
        }
        
        target = total / k
        
        self.nums.sort()
        
        if self.nums.last! > target
        {
            return false
        }
        
        var k = k
        
        while k >= 0 && self.nums.last! == target
        {
            k -= 1
            self.nums.popLast()
        }
        
        var groups = Array(repeating: 0, count: k)
        
        return dfs(&groups)
    }
    
    private func dfs(_ groups: inout [Int]) -> Bool
    {
        if self.nums.isEmpty
        {
            return true
        }
        
        let n = self.nums.popLast()!
        
        for i in 0 ..< groups.count
        {
            if groups[i] + n <= target
            {
                groups[i] += n
                
                if dfs(&groups)
                {
                    return true
                }
                
                groups[i] -= n
            }
            
            if groups[i] == 0
            {
                break
            }
        }
        
        nums.append(n)
        
        return false
    }
}