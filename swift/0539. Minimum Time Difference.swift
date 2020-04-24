// 539. Minimum Time Difference
// https://leetcode.com/problems/minimum-time-difference/


class Solution 
{
    func findMinDifference(_ timePoints: [String]) -> Int 
    {
        var ans = Int.max
        
        var arr: [Int] = []
        
        for i in 0 ..< timePoints.count
        {
            arr.append(str2int(timePoints[i]))
        }
        
        arr.sort()
        arr.append(24 * 60 + arr[0])
        
        for i in 1 ..< arr.count
        {
            let t1 = arr[i-1]
            let t2 = arr[i]
            
            ans = min(ans, t2 - t1)
        }
        
        return ans
    }
    
    private func str2int(_ str: String) -> Int
    {
        let arr = str.components(separatedBy: ":")
        
        return Int(arr[0])! * 60 + Int(arr[1])!
    }
}