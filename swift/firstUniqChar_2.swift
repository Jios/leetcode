class Solution {
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
