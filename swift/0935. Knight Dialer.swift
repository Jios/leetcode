// 935. Knight Dialer
// https://leetcode.com/problems/knight-dialer/


class Solution 
{
    let mode = 1e9 + 7
    let moves = [[4,6],[6,8],[7,9],[4,8],[3,9,0],[],[1,7,0],[2,6],[1,3],[2,4]]

    func knightDialer(_ N: Int) -> Int 
    {
        var memo: [[Int]] = Array(repeating: Array(repeating: -1, count: 10), 
                                  count: N + 1)
        
        var ans = 0
        
        for i in 0 ..< 10
        {
            ans = (ans + dp(N, i, &memo)) % Int(mode)
        }
        
        // print(memo)
        
        return ans
    }
    
    private
    func dp(_ N: Int, _ k: Int, _ memo: inout [[Int]]) -> Int
    {
        if N == 1
        {
            return 1
        }
        
        if memo[N][k] != -1
        {
            return memo[N][k]
        }
        
        var ans = 0
        
        for step in moves[k]
        {
            ans = (ans + dp(N - 1, step, &memo)) % Int(mode)
        }
        
        memo[N][k] = ans
        
        return ans
    }
}