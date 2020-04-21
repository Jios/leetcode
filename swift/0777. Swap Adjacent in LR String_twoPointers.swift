// 777. Swap Adjacent in LR String
// https://leetcode.com/problems/swap-adjacent-in-lr-string/


class Solution {
    func canTransform(_ start: String, _ end: String) -> Bool {        
        let start = Array(start), end = Array(end)
        if start.count != end.count {
            return false
        }
        let N = start.count
        var p1 = 0, p2 = 0
        while p1 < N, p2 < N {
            while p1 < N, start[p1] == "X" {
                p1 += 1
            }
            while p2 < N, end[p2] == "X" {
                p2 += 1
            }
            
            if p1 == N, p2 == N {
                return true
            }
            if p1 == N || p2 == N {
                return false
            }
            
            if start[p1] != end[p2] {
                return false
            }
            
            if start[p1] == "L", p1 < p2 {
                return false
            }
            if start[p1] == "R", p1 > p2 {
                return false
            }
            
            p1 += 1
            p2 += 1
        }
        
        return true
    }
}