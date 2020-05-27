// Remove Duplicates from Sorted Array
// https://leetcode.com/explore/featured/card/top-interview-questions-easy/92/array/727/


class Solution 
{
    func removeDuplicates(_ nums: inout [Int]) -> Int 
    {
        var i = 0
        for j in 0..<nums.count 
        {
            if nums[i] != nums[j] 
            {
                i += 1
                nums[i] = nums[j]
            }
        }
        return nums.isEmpty ? 0 : i+1
    }
}