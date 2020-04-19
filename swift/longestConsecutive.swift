class Solution 
{
    func longestConsecutive(_ nums: [Int]) -> Int 
    {
        guard nums.count > 0 else {
            return 0
        }
        
        var count = 0
        
        let set = Set(nums)
        
        for num in nums
        {
            if set.contains(num - 1)
            {
                continue
            }
            
            count = max(1, count)
            
            var next = num + 1
            
            while set.contains(next)
            {
                next += 1
                count = max(count, next - num)
            }
        }
        
        return count
    }
}




let s = Solution()
let res = s.longestConsecutive([100,4,200,1,3,2])