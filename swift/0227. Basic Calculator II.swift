// 227. Basic Calculator II
// https://leetcode.com/problems/basic-calculator-ii/


class Solution 
{
    func calculate(_ s: String) -> Int 
    {
        var stack: [Int] = []
        var sign: Character = "+"
        var num = 0
        
        for i in 0 ..< s.count
        {
            let c = s[i]
            
            if let n = c.wholeNumberValue
            {
                num = num * 10 + n
            }
            
            if i == s.count - 1 || ["+", "-", "*", "/"].contains(c)
            {
                if sign == "+"
                {
                    stack.append(num)
                }
                else if sign == "-"
                {
                    stack.append(-num)
                }
                else if sign == "*"
                {
                    let k = stack.count - 1
                    stack[k] = stack[k] * num
                }
                else if sign == "/"
                {
                    let k = stack.count - 1
                    stack[k] = stack[k] / num
                }
                
                sign = c
                num = 0
            }
        }
        
        let sum = stack.reduce(0, +)
        
        return sum
    }
}

extension String
{
    subscript(i: Int) -> Character
    {
        return self[index(startIndex, offsetBy: i)]
    }
}