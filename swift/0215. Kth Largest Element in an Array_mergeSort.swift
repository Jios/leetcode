// 215. Kth Largest Element in an Array
// https://leetcode.com/problems/kth-largest-element-in-an-array/

class Solution 
{
    func mergeSort(_ nums: [Int]) -> [Int] 
    {
        if (nums.count == 0 || nums.count == 1) {
            return nums
        }

        let left = Array(nums[0..<nums.count/2])
        let right = Array(nums[nums.count/2..<nums.count])

        return merge(mergeSort(left), mergeSort(right))
    }

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var left = left
        var right = right
        var solution = [Int]()

        while left.count > 0 && right.count > 0 {
            if (left.first! < right.first!) {
                solution.append(left.removeFirst())
            } else {
                solution.append(right.removeFirst())
            }
        }

        return solution + left + right
    }

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int 
    {
        var sorted = nums
        sorted.sort { (left, right) -> Bool in
            left < right
        }
        let fromRight = nums.count - k
        return sorted[fromRight]
    }
}