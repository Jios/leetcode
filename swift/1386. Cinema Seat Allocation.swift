// 1386. Cinema Seat Allocation
// https://leetcode.com/problems/cinema-seat-allocation/


class Solution
{
    func maxNumberOfFamilies(_ n: Int, _ reservedSeats: [[Int]]) -> Int
    {
        var ans = 0
        var hash: [Int: Set<Int>] = [:]
        
        for seat in reservedSeats
        {
            hash[seat[0], default: []].insert(seat[1])
        }
        
        // print(hash)
        
        for (k, vals) in hash
        {
            var count = 0
            
            if !vals.contains(2) && !vals.contains(3) && !vals.contains(4) && !vals.contains(5)
            {
                count += 1
            }
            
            if !vals.contains(6) && !vals.contains(7) && !vals.contains(8) && !vals.contains(9)
            {
                count += 1
            }
            
            if count == 0 
            && !vals.contains(4) && !vals.contains(5) && !vals.contains(6) && !vals.contains(7)
            {
                count += 1
            }
            
            ans += count
        }
        
        ans += (n - hash.keys.count) * 2
        
        return ans
    }
}