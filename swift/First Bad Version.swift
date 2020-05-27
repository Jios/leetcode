// First Bad Version
// https://leetcode.com/explore/featured/card/top-interview-questions-easy/96/sorting-and-searching/774/


/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl 
{
    func firstBadVersion(_ n: Int) -> Int 
    {
        var left = 1, right = n
        var ans = Int.max
        
        while left < right
        {
            let mid = (left + right) / 2
            
            if isBadVersion(mid)
            {
                // bad
                right = mid
            }
            else
            {
                // good
                left = mid + 1
            }
        }
        
        
        return left
    }
}