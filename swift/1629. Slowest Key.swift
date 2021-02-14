// 1629. Slowest Key
// https://leetcode.com/problems/slowest-key/


class Solution 
{
    func slowestKey(_ releaseTimes: [Int], 
                    _ keysPressed: String) -> Character 
    {
        var ans: Character = "?"
        var previousTime = 0
        var maxTime = 0
        var i = 0
        
        for c in keysPressed
        {
            let diffTime = releaseTimes[i] - previousTime
            
            if diffTime == maxTime
            {
                ans = ans.asciiValue! > c.asciiValue! ? ans : c
                // ans = [ans, c].sorted()[1]
            }
            else if diffTime > maxTime
            {
                maxTime = diffTime
                ans = c
            }
            
            previousTime = releaseTimes[i]
            i += 1
        }
        
        return ans
    }
}