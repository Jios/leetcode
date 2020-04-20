// 215. Kth Largest Element in an Array
// https://leetcode.com/problems/kth-largest-element-in-an-array/

class Solution
{
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int
    {
        var nums = nums
        let count = nums.count
        let target = count - k
        
        var left = 0, right = count - 1
        
        while left <= right
        {
            let pivotIdx = partition(&nums, left, right)
            
            if pivotIdx == target
            {
                return nums[pivotIdx]
            }
            else if pivotIdx > target
            {
                right = pivotIdx - 1
            }
            else
            {
                left = pivotIdx + 1
            }
        }
        
        return -1
    }
    
    
    private func partition(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int
    {
        let pivot = nums[high]
        var idx = low
        
        for i in low ..< high
        {
            if nums[i] <= pivot
            {
                (nums[i], nums[idx]) = (nums[idx], nums[i])
                idx += 1
            }
        }
        
        (nums[high], nums[idx]) = (nums[idx], nums[high])

        return idx
    }
}



/*
class Solution 
{ 
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int 
    {
        var nums = nums
        var low = 0, high = nums.count-1
        
        var index = quickSelect(low, high, &nums)

        while index != k-1 
        {
            if index < k-1 {
                low = index+1
            } else {
                high = index-1
            }            
            index = quickSelect(low, high, &nums)
        }
        
        return nums[index]
    }
    
    private func quickSelect(_ low: Int, _ high: Int, _ nums: inout [Int]) -> Int 
    {
        guard low < high else { return low }
        
        let pivotIndex = Int.random(in: low...high)
        let pivot = nums[pivotIndex]
        nums.swapAt(high, pivotIndex)
        
        var cur = low
        for i in low...high {
            if nums[i] > pivot {
                nums.swapAt(cur, i)
                cur += 1
            }
        }
        
        nums.swapAt(cur, high)
        return cur
    }
}
*/