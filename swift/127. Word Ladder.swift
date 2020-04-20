// 127. Word Ladder
// https://leetcode.com/problems/word-ladder/


class Solution 
{
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int 
    {
        if !wordList.contains(endWord) 
        {
            return 0
        }

        let a2z = "abcdefghijklmnopqrstuvwxyz"

        var beginSet = Set<String>()
        var endSet = Set<String>()
        
        var len = 1
        var visit = Set<String>()

        beginSet.insert(beginWord)
        endSet.insert(endWord)

        while !beginSet.isEmpty && !endSet.isEmpty 
        {
            if beginSet.count > endSet.count 
            {
                swap(&beginSet, &endSet)
            }

            var temp = Set<String>()
            for word in beginSet 
            {
                var chars = Array(word)
                for i in 0..<chars.count 
                {
                    for char in a2z 
                    {
                        let old = chars[i]
                        chars[i] = char
                        let target = String(chars)

                        if endSet.contains(target) 
                        {
                            return len + 1
                        }
                        
                        if !visit.contains(target) && wordList.contains(target) 
                        {
                            temp.insert(target)
                            visit.insert(target)
                        }

                        chars[i] = old
                    }
                }
            }

            beginSet = temp
            len += 1
        }

        return 0
    }
}



// MARK: ================================================================================



let s = Solution().ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
print(s)