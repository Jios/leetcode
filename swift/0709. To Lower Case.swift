// 709. To Lower Case
// https://leetcode.com/problems/to-lower-case/


class Solution 
{
    func toLowerCase(_ str: String) -> String 
    {
        var arrStr = Array(str)
        let offset = 97 - 65
        let capitalRange = 65...90
        
        for i in 0 ..< arrStr.count
        {
            if let asciiValue = arrStr[i].asciiValue
                ,  capitalRange.contains(Int(asciiValue))
            {
                let val = Int(asciiValue) + offset
                
                if let unicodeScalar = UnicodeScalar(val)
                {
                    arrStr[i] = Character(unicodeScalar)
                }
            }
        }
        
        return String(arrStr)
    }
}