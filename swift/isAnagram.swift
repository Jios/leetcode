//
// valid anagram 
//

class Solution 
{
    func isAnagram(_ s: String, _ t: String) -> Bool 
    {
        guard s.count == t.count else { return false }
        
        let arrS = Array(s.utf8)
        let arrT = Array(t.utf8)
        
        var map = [Int](repeating: 0, count: 26)
        
        for i in arrS.indices 
        {
            map[Int(arrS[i] - 97)] += 1
            map[Int(arrT[i] - 97)] -= 1
        }

        return !map.contains { $0 != 0 }
    }
}