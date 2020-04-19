class Solution
{
    func countAndSay(_ n: Int) -> String
    {
//        return helper(n).joined()

        if n == 1
        {
            return "1"
        }

        let str = countAndSay(n-1)

        var count: Int = 0
        var left = 0
        var right = 0

        var result: String = ""

        while right < str.count
        {
            if left == right
            {
                count = 1
                right += 1
            }
            else if char(str, offset: left) == char(str, offset: right)
            {
                count += 1
                right += 1
            }
            else
            {
                let c = char(str, offset: left)
                result += "\(count)\(c)"
                left = right
            }
        }

        let c = char(str, offset: left)
        result += "\(count)\(c)"

        return result
    }

    private func char(_ str: String, offset: Int) -> Character
    {
        let index = str.index(str.startIndex, offsetBy: offset)
        return str[index]
    }

    func helper(_ n: Int) -> [String]
    {
        if n == 1
        {
            return ["1"]
        }

        let strs: [String] = helper(n-1)

        var count: Int = 0
        var left = 0
        var right = 0

        var results: [String] = []

        while right < strs.count
        {
            if left == right
            {
                count = 1
                right += 1
            }
            else if strs[left] == strs[right]
            {
                count += 1
                right += 1
            }
            else
            {
                results.append(contentsOf: [String(count), strs[left]])
                left = right
            }
        }

        results.append(contentsOf: [String(count), strs[left]])

        return results
    }
}

let result = Solution().countAndSay(4)
print(result)