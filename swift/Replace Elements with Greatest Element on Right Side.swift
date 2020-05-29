// Replace Elements with Greatest Element on Right Side
// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3259/


class Solution 
{
    func replaceElements(_ arr: [Int]) -> [Int] 
    {
        guard !arr.isEmpty else {
            return arr
        }
        
        let count = arr.count
        
        var result = Array(repeating: -1, count: count)
        var greatest = arr[count - 1]
        
        var i = arr.count - 2
        
        while i >= 0
        {
            result[i] = greatest
            greatest = max(greatest, arr[i])
            
            i -= 1
        }
        
        return result
    }
}