// 1202. Smallest String With Swaps
// https://leetcode.com/problems/smallest-string-with-swaps/


class Solution 
{
    var parent = [Int]()
    var rank = [Int]()

    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String 
    {
        var chars = [Int: [Character]]()
        var indexes = [Int: [Int]]()
        let array = Array(s)
        var result = array
        
        for i in 0..<array.count 
        {
            parent.append(i)
            rank.append(1)
        }
        
        for i in pairs 
        {
            union(i[0], i[1])
        }
        
        for i in 0 ..< array.count 
        {
            let index = find(i)
            chars[index, default: [Character]()].append(array[i]) 
            indexes[index, default: [Int]()].append(i)
        }
        
        for (key, value) in chars 
        {
            let charsArray = value.sorted()
            let indexArray = indexes[key] ?? []
            
            for i in 0..<charsArray.count 
            {
                result[indexArray[i]] = charsArray[i]
            }
        }

        return String(result)
    }
    
    
    private
    func find(_ value: Int) -> Int 
    {
        if parent[value] == value {
            return value
        }
        
        parent[value] = find(parent[value])
        return parent[value]
    }
    
    private
    func union(_ first: Int, _ second: Int) 
    {
        let first = find(first)
        let second = find(second)
        
        if first != second 
        {
            if rank[first] < rank[second] 
            {
                parent[first] = parent[second]
            }
            else
            {
                parent[second] = parent[first]
                rank[first] += 1
            }
        }
    }
}