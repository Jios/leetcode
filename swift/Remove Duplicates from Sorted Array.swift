// Remove Duplicates from Sorted Array
// https://leetcode.com/explore/featured/card/top-interview-questions-easy/92/array/727/


class Solution 
{
    func removeDuplicates(_ nums: inout [Int]) -> Int 
    {
        guard !nums.isEmpty else {
            return 0
        }
        
        var i = 0
        
        while i < nums.count-1
        {
            if nums[i] == nums[i+1]
            {
                nums.remove(at: i+1)
            }
            else
            {
                i += 1
            }
        }
        
        return nums.count
    }
}