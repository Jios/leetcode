// 1615. Maximal Network Rank
// https://leetcode.com/problems/maximal-network-rank/


class Solution {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var dict = [Int: Set<Int>]()
        var res = 0
        for i in roads {
            dict[i[0], default: []].insert(i[1])
            dict[i[1], default: []].insert(i[0])
        }
        
        for i in 0...n {
            for j in 0...n where j != i {
                let first = dict[i] ?? []
                let second = dict[j] ?? []
                var total = first.count + second.count
                if first.contains(j) && second.contains(i) {
                    total -= 1
                }
                res = max(res, total)
            }
        }
        
        return res
    }
}