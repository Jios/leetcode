// 34. Find First and Last Position of Element in Sorted Array
// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/


class Solution 
{
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] 
    {
        var left = 0, right = nums.count - 1
        
        while left <= right
        {
            let mid = (right + left) / 2
            let n = nums[mid]
            
            if n == target
            {
                left = mid
                right = mid
                
                // print("\(left), \(right); \(mid)")
                
                while left - 1 >= 0 
                    && nums[left - 1] == target
                {
                    left -= 1
                }
                
                while right + 1 < nums.count
                    && nums[right + 1] == target
                {
                    right += 1
                }
                
                return [left, right]
            }
            else if target < n
            {
                right = mid - 1
            }
            else
            {
                left = mid + 1
            }
            
            // print("\(left), \(right); \(mid)")
        }
        
        return [-1, -1]
    }
}