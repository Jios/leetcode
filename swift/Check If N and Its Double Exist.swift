// Check If N and Its Double Exist
// https://leetcode.com/explore/learn/card/fun-with-arrays/527/searching-for-items-in-an-array/3250/


class Solution 
{
    func checkIfExist(_ arr: [Int]) -> Bool 
    {
        var set: Set<Int> = []
        
        for n in arr
        {
            if set.contains(n * 2) || (n % 2 == 0 && set.contains(n / 2))
            {
                return true
            }
            
            set.insert(n)
        }
        
        return false
    }
}