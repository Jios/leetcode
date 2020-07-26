// 1165. Single-Row Keyboard
// https://leetcode.com/problems/single-row-keyboard/


class Solution 
{
    func calculateTime(_ keyboard: String, _ word: String) -> Int 
    {
        var ans = 0
        var current = 0
        
        var hash: [Character: Int] = [:]
        let arr = Array(keyboard)
        
        for i in 0 ..< arr.count
        {
            let c = arr[i]
            hash[c] = i
        }
        
        for c in word
        {
            if let i = hash[c]
            {
                ans += abs(current - i)
                current = i
            }
        }
        
        return ans
    }
}