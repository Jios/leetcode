// 961. N-Repeated Element in Size 2N Array
// https://leetcode.com/problems/n-repeated-element-in-size-2n-array/


class Solution 
{
    func repeatedNTimes(_ A: [Int]) -> Int 
    {
        var hash: [Int: Int] = [:]
        let target = A.count / 2
        
        for n in A
        {
            let count = (hash[n] ?? 0) + 1
            hash[n] = count
            
            // print(n)
            
            if count == target
            {
                return n
            }
        }
        
        return -1
    }
}