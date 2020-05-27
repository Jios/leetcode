// Merge Sorted Array
// https://leetcode.com/explore/featured/card/top-interview-questions-easy/96/sorting-and-searching/587/


class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        let copy = nums1[..<m]
        
        var p1 = 0, p2 = 0
        var i = 0
        
        while p1 < m && p2 < n
        {
            if copy[p1] <= nums2[p2]
            {
                nums1[i] = copy[p1]
                p1 += 1
            }
            else
            {
                nums1[i] = nums2[p2]
                p2 += 1
            }
            
            i += 1
        }
        
        if p1 < m
        {
            while p1 < m
            {
                nums1[i] = copy[p1]
                i += 1
                p1 += 1
            }
        }
        else if p2 < n
        {
            while p2 < n
            {
                nums1[i] = nums2[p2]
                i += 1
                p2 += 1
            }
        }
    }
}