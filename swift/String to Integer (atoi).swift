// String to Integer (atoi)
// https://leetcode.com/explore/featured/card/top-interview-questions-easy/127/strings/884/


class Solution 
{
    func myAtoi(_ str: String) -> Int 
    {
        guard !str.isEmpty else {
            return 0
        }
        
        var answer = 0
        var sign = 1
        var isValidInput = true
        
        var k = 0
        
        while k < str.count && str[k] == " "
        {
            k += 1
        }
        
        if !isValid(str, k)
        {
            return 0
        }
        
        if str[k] == "-"
        {
            sign = -1
            k += 1
        }
        else if str[k] == "+"
        {
            sign = 1
            k += 1
        }

        
        for i in k ..< str.count
        {
            let c = str[i]
            
            if str.isDigit(i)
            , let n = c.asciiValue
            {
                let d = Int(n - Character("0").asciiValue!)
                answer = answer * 10 + sign * d
                
                if answer > Int32.max
                {
                    return Int(Int32.max)
                }
                else if answer < Int32.min
                {
                    return Int(Int32.min)
                }
                print("\(d); \(answer)")
            }
            else
            {
                break
            }
        }
        
        return answer
    }
    
    private func isValid(_ str: String, _ i: Int) -> Bool
    {
        if i >= str.count
        {
            return false
        }
        
        if str.isDigit(i)
        {
            return true
        }
        else if (str[i] == "-" || str[i] == "+") //&& str.isDigit(i + 1)
        {
            return true
        }
        
        return false
    }
}


extension String
{
    subscript(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    func isDigit(_ i: Int) -> Bool
    {
        guard i < count else {
            return false
        }
        
        if Character("0") <= self[i] && self[i] <= Character("9")
        {
            return true
        }
        
        return false
    }
}