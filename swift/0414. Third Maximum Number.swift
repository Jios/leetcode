// 414. Third Maximum Number
// https://leetcode.com/problems/third-maximum-number/


class Solution 
{
    func thirdMax(_ nums: [Int]) -> Int 
    {
        var numSet: Set<Int> = []
        
        for n in nums
        {
            if numSet.count < 3
            {
                numSet.insert(n)
            }
            else if let minNum = numSet.min()
            {
                if !numSet.contains(n) && n > minNum
                {
                    numSet.remove(minNum)
                    numSet.insert(n)
                }
            }
        }
        
        if numSet.count == 3
        {
            return numSet.min()!
        }
        else
        {
            return numSet.max()!
        }
    }
}