// 997. Find the Town Judge
// https://leetcode.com/problems/find-the-town-judge/


class Solution 
{
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int 
    {
        if trust.isEmpty 
        {
            return N == 1 ? 1 : -1
        }
        
        var trustHash: [Int: Set<Int>] = [:]
        var notTrust: Set<Int> = []
        
        for relation in trust
        {
            trustHash[relation[1], default: []].insert(relation[0])
            notTrust.insert(relation[0])
        }
        
        for key in trustHash.keys
        {
            if !notTrust.contains(key) 
               && trustHash[key]!.count == N - 1
            {
                return key
            }
        }
        
        return -1
    }
}