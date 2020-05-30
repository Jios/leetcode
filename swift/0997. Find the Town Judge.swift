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



class Solution 
{
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int 
    {
        if N == 1 { return 1 }
        if trust.count <= 0 { return -1 }

        var res = [Int](repeating: 0, count: N)
        
        for i in 0 ..< trust.count {
            let toTrust = trust[i][0]
            let beTrust = trust[i][1]
            res[toTrust - 1] -= 1
            res[beTrust - 1] += 1
        }
        
        for i in 0 ..< res.count 
        {
            if res[i] == (N - 1) 
            {
                return i + 1
            }
        }

        return -1
      
      
      /*
      guard trust.count > 0 else { return 1}
      
      var dic:[Int:Set<Int>] = [:]
      var trusty:Set<Int> = []
      
      for el in trust {
        dic[el.last!, default:[]].insert(el.first!)
        trusty.insert(el.first!)
      }
      
      let judge = dic.filter{$0.value.count == N-1}
      
      if judge.count == 0 {
        return -1
      }
      //print(judge)
      let j = judge.keys.first!
    
      if trusty.contains(j) {
        return -1
      }
      return judge.count > 1 ? -1 : j*/
    }
}
