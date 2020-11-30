/*
 https://github.com/jolly-fellow/microsoft/tree/master/pattern_recognition
 
 Pattern recognition
 Given a pattern as the first argument and a string of blobs split by | show the number of times the pattern is present in each blob and the total number of matches.

 ###Input: The input consists of the pattern (“bc” in the example) which is separated by a semicolon followed by a list of blobs (“bcdefbcbebc|abcdebcfgsdf|cbdbesfbcy|1bcdef23423bc32” in the example). Example input: bc;bcdefbcbebc|abcdebcfgsdf|cbdbesfbcy|1bcdef23423bc32

 ###Output: The output should consist of the number of occurrences of the pattern per blob (separated by |). Additionally, the final entry should be the summation of all the occurrences (also separated by |).

 Example output: 3|2|1|2|8 where ‘bc’ was repeated 3 times, 2 times, 1 time, 2 times in the 4 blobs passed in. And 8 is the summation of all the occurrences (3+2+1+2 = 8)

 Test 1
 Test Input
 bc;bcdefbcbebc|abcdebcfgsdf|cbdbesfbcy|1bcdef23423bc32
 Expected Output
 3|2|1|2|8

 Test 2
 Test Input
 aa;aaaakjlhaa|aaadsaaa|easaaad|sa
 Expected Output
 4|4|2|0|10

 Test 3
 Test Input
 b;bcdefbcbebc|abcdebcfgsdf|cbdbesfbcy|1bcdef23423bc32
 Expected Output
 4|2|3|2|11

 Test 4
 Test Input
 ;bcdefbcbebc|abcdebcfgsdf|cbdbesfbcy|1bcdef23423bc32
 Expected Output
 0|0|0|0|0
 
*/


func solution(_ S: String) -> String
{
    let s = Array(S)
    var ans: [Int] = []
    var pattern = ""
    var i = 0
    
    while i < s.count && s[i] != ";"
    {
        pattern.append(s[i])
        i += 1
    }
    
    var blob = ""
    var count = 0
    
    while i < s.count
    {
        let c = s[i]
        
        if c == "|"
        {
            blob = ""
            ans.append(count)
            count = 0
            
            i += 1
            continue
        }
        
        blob.append(c)
        
        if !pattern.isEmpty
            && blob.count >= pattern.count
            && blob.substringFromEnd(pattern.count) == pattern
        {
            count += 1
        }
        
        i += 1
    }
    
    ans.append(count)
    
    let sum = ans.reduce(0, +)
    ans.append(sum)
    
    return ans.map{ String($0) }.joined(separator: "|")
}

extension String
{
    func substringFromEnd(_ offset: Int) -> String
    {
        let idx = index(endIndex, offsetBy: (offset * -1))
        return String(self[idx ..< endIndex])
    }
}


print(solution("bc;bcdefbcbebc|abcdebcfgsdf|cbdbesfbcy|1bcdef23423bc32"))
print(solution(";bcdefbcbebc|abcdebcfgsdf|cbdbesfbcy|1bcdef23423bc32"))

assert(solution("bc;bcdefbcbebc|abcdebcfgsdf|cbdbesfbcy|1bcdef23423bc32") == "3|2|1|2|8")
assert(solution("aa;aaaakjlhaa|aaadsaaa|easaaad|sa") == "4|4|2|0|10")
assert(solution("b;bcdefbcbebc|abcdebcfgsdf|cbdbesfbcy|1bcdef23423bc32") == "4|2|3|2|11")
assert(solution(";bcdefbcbebc|abcdebcfgsdf|cbdbesfbcy|1bcdef23423bc32") == "0|0|0|0|0")
