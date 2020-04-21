// 726. Number of Atoms
// https://leetcode.com/problems/number-of-atoms/


class Solution 
{
    var formula: [Character] = []
    
    func countOfAtoms(_ formula: String) -> String 
    {
        self.formula = Array(formula)
        var i = 0
        
        let hash = getAtoms(&i)
        
        return hash.sorted(by: <).map { $0.key + "\($0.value > 1 ? String($0.value) : "")"}.joined()
    }
    
    private func getAtoms(_ i: inout Int) -> [String: Int]
    {
        var hash: [String: Int] = [:]
        
        while i < formula.count
        {
            let c = formula[i]
            
            // print(c)
            
            if c == "("
            {
                i += 1
                let dict = getAtoms(&i)
                mergeHashes(&hash, dict)
            }
            else if c == ")"
            {
                i += 1
                
                let count = getCount(&i)
                for key in hash.keys
                {
                    hash[key] = hash[key]! * count
                }
                
                return hash
            }
            
            if c.isUppercase
            {
                if let name = getName(&i)
                {
                    let count = getCount(&i)
                    hash[name] = (hash[name] ?? 0) + max(count, 1)
                }
            }
        }
        
        return hash
    }
    
    private func mergeHashes(_ hash: inout [String: Int], 
                             _ dict: [String: Int])
    {
        for key in dict.keys
        {
            if let count = hash[key]
            {
                hash[key] = count + dict[key]!
            }
            else
            {
                hash[key] = dict[key]!
            }
        }
    }
    
    private func getName(_ i: inout Int) -> String?
    {
        guard i < formula.count && formula[i].isUppercase else {
            return nil
        }
        
        var name = String(formula[i])
        i += 1
        
        while i < formula.count && formula[i].isLetter && !formula[i].isUppercase
        {
            name += String(formula[i])
            i += 1
        }
        
        return name
    }
    
    private func getCount(_ i: inout Int) -> Int
    {
        var count = 0
        
        while i < formula.count, let n = formula[i].wholeNumberValue
        {
            count = count * 10 + n
            i += 1
        }
        
        return max(count, 1)
    }
}