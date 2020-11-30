/*
 https://github.com/jolly-fellow/microsoft/tree/master/largest_alphabetic_character
 
 Given a string S, find the largest alphabetic character, whose both uppercase and lowercase appear in S. The uppercase character should be returned. For example, for S = "admeDCAB", return "D". If there is no such character, return "NO".
 
*/


let aVal = Int(Character("a").asciiValue!)
let AVal = Int(Character("A").asciiValue!)

func solution(_ S: String) -> String
{
    let s = Array(S)
    
    var ans = "NO"
    var maxAlp: UInt8 = 0
    var set: Set<String> = []
    
    for i in 0 ..< s.count
    {
        let c = s[i]
        
        if !c.isLetter
        {
            continue
        }
        
        if (c.isLowercase && set.contains(c.uppercased()))
            || (c.isUppercase && set.contains(c.lowercased()))
        {
            let asciiValue = c.asciiValue!
            
            if asciiValue > maxAlp
            {
                maxAlp = asciiValue
                ans = c.uppercased()
            }
        }
        else
        {
            set.insert(String(c))
        }
    }
    
    return ans
}


assert(solution("EadmeDCAB") == "E", "E")
assert(solution("admeCBe") == "NO", "NO")
assert(solution("admeCAB") == "A", "A")