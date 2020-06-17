// 1365. How Many Numbers Are Smaller Than the Current Number
// https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/


class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] 
    {
        let sortedNums = nums.sorted()
        let count = nums.count
        
        var ans: [Int] = Array(repeating: 0, count: count)
        var i = 0
        
        for i in 0 ..< nums.count
        {
            let n = nums[i]
            
            var k = 0
            while k < count && n > sortedNums[k]
            {
                k += 1
            }
            
            ans[i] = k
        }
        
        return ans
    }
}