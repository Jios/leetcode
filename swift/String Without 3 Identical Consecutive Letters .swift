/*
 https://github.com/jolly-fellow/microsoft/tree/master/string_without_3_identical_consecutive_letters
 
 Write a function `solution` that, given a string S of N lowercase English letters, returns a string with no instances of three identical consecutive letters, obtained from S by deleting the minimum possible number of letters.
 
 Example:
 1. Given S = "eedaaad", the function should return "eedaad".  One occurrence of letter a is deleted.
 
 2. Give S = "xxxtxxx", the function should return "xxtxx".  Note that letter x can occur more than three times in the returned string, if the occurrences are not consecutive.
 
 3. Give S = "uuuuxaaaaxuuu", the function should return "uuxaaxuu".
 
 Write an efficient algorithm for the following assumptions:
 * N is an interger within the range [1..200,000]
 * string S consists only of lowercase letters (a-z)
 
*/


let maxCount = 3

func solution(_ S: String) -> String
{
    if S.count < maxCount
    {
        return S
    }
    
    let s = Array(S)
    
    var ans: [Character] = []
    ans.append(s[0])
    ans.append(s[1])
    
    for i in 2 ..< s.count
    {
        let c = s[i]
        
        if s[i - 2] != c || s[i - 1] != c
        {
            ans.append(c)
        }
    }
    
    return String(ans)
}


assert(solution("eedaaad") == "eedaad", "eedaad")
assert(solution("xxxtxxx") == "xxtxx", "xxtxx")
assert(solution("uuuuxaaaaxuuu") == "uuxaaxuu", "uuxaaxuu")
