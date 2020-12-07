// 41. First Missing Positive
// https://leetcode.com/problems/first-missing-positive/


// space: O(1)

class Solution
{
    func firstMissingPositive(_ nums: [Int]) -> Int
    {
        var nums = nums
        
        for i in 0 ..< nums.count
        {
            var idxVal = nums[i] - 1
            
            while (1 ..< nums.count).contains(nums[i])
                    && nums[idxVal] != nums[i]
            {
                nums.swapAt(i, idxVal)
                
                idxVal = nums[i] - 1
            }
        }
        
        print(nums)
        
        for i in 0 ..< nums.count
        {
            if i + 1 != nums[i]
            {
                return i + 1
            }
        }
        
        return nums.count + 1
    }
}


// space: O(n)
/*
class Solution 
{
    func firstMissingPositive(_ nums: [Int]) -> Int 
    {
        var arr = Array(repeating: false,
                        count: nums.count + 1)
        
        for n in nums
        {
            if (0 ... nums.count).contains(n)
            {
                arr[n] = true
            }
        }
        
        arr[0] = true
        
        for i in 0 ..< arr.count
        {
            if arr[i] == false
            {
                return i
            }
        }
        
        return arr.count
    }
}
// */