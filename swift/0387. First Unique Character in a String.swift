// 387. First Unique Character in a String
// https://leetcode.com/problems/first-unique-character-in-a-string/


class Solution2
{
    func firstUniqChar(_ s: String) -> Int 
    {
        var arr = Array(repeating: 0, count: 26)
        let base = Int(UnicodeScalar("a").value)
        var index = 0

        for character in s.unicodeScalars 
        {
            arr[Int(character.value) - base] += 1 
        }
        
        for val in s.unicodeScalars 
        {
            if arr[Int(val.value) - base] == 1 
            {
                return index
            }
            index += 1
        }
        return -1
    }
}


class Solution 
{
    func firstUniqChar(_ s: String) -> Int
    {
        let arrStr = Array(s)
        var hash: [Character: Int] = [:]

        for i in 0 ..< arrStr.count
        {
            let c = arrStr[i]
            hash[c] = (hash[c] ?? 0) + 1
        }

        for i in 0 ..< arrStr.count
        {
            let c = arrStr[i]
            if hash[c] == 1
            {
                return i
            }
        }

        return -1
    }
}

let str = "z"
let i = Solution().firstUniqChar(str)

print(i)
