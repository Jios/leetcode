// Rotate Array
// https://leetcode.com/explore/featured/card/top-interview-questions-easy/92/array/646/


class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) 
    {
        guard !nums.isEmpty else {
            return
        }
        
        let k = k % nums.count
        
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, k - 1)
        reverse(&nums, k, nums.count - 1)
    }
    
    private func reverse(_ nums: inout [Int], _ start: Int, _ end: Int)
    {
        var i = start, j = end
        
        while i < j
        {
            (nums[i], nums[j]) = (nums[j], nums[i])
            
            i += 1
            j -= 1
        }
    }
}


/*
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) 
    {
        var k = k 
        
        while k > 0
        {
            let num = nums.removeLast()
            nums.insert(num, at: 0)
            
            k -= 1
        }
    }
}
*/