class Solution 
{
    let str = "abcdefghijklmnopqrstuvwxyz"
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int 
    {
        let wordSet = Set(wordList)
        
        if !wordSet.contains(endWord)
        {
            return 0
        }
        
        var queue: [(String, Int)] = [(beginWord, 1)]
        
        let allChars = Array(str)
        
        while !queue.isEmpty
        {
            let (word, level) = queue.removeFirst()
            
            let arrChar: [Character] = Array(word)
            
            for i in 0 ..< arrChar.count
            {   
                var letters: [Character] = arrChar
                
                for c in allChars
                {
                    if c != arrChar[i]
                    {
                        letters[i] = c
                        
                        let w = String(letters)
                        
                        if w == endWord
                        {
                            return level + 1
                        }
                        else if wordSet.contains(w)
                        {
                            queue.append((w, level + 1))
                        }
                    }
                }

                // let words = word.newWords(i)
                // for w in words
                // {
                //     if w == endWord
                //     {
                //         return level + 1
                //     }
                //     else if wordSet.contains(w)
                //     {
                //         queue.append((w, level + 1))
                //     }
                // }
            }
        }
        
        // print("Not found")
        return 0
    }
}



extension String
{
//     var allChars: [Character] {
//         let aScalars = "a".unicodeScalars
//         let aCode = aScalars[aScalars.startIndex].value

//         let letters: [Character] = (0..<26).map {
//             i in Character(UnicodeScalar(aCode + i)!)
//         }
        
//         return letters
//     }
    
    // subscript(i: Int) -> Character {
    //     return self[index(startIndex, offsetBy: i)]
    // }
    
//     func newWords(_ i: Int) -> [String]
//     {
//         var arrWords: [String] = Array(repeating: "", count: 25)
        
//         let str = "abcdefghijklmnopqrstuvwxyz"
//         let allChars = Array(str)
        
//         let idx = self.index(startIndex, offsetBy: i)
//         let startStr = String(self[..<idx])
        
//         let idxEnd = self.index(after: idx)
//         let endStr = String(self[idxEnd...])
        
//         let arrStr = Array(self)
//         var k = 0
//         for c in allChars
//         {
//             if c != arrStr[i]
//             {
//                 arrWords[k] = startStr + String(c) + endStr
//                 k += 1
//             }
//         }
        
//         return arrWords
//     }
    
    func newWords(_ i: Int) -> [String]
    {
        let arr = Array(self)
        var arrWords: [[Character]] = Array(repeating: arr, count: 25)
        
        let str = "abcdefghijklmnopqrstuvwxyz"
        let allChars = Array(str)
        
        var k = 0
        for c in allChars
        {
            if c != arr[i]
            {
                arrWords[k][i] = c
                k += 1
            }
        }
        
        var words: [String] = []
        
        for i in 0 ..< arrWords.count
        {
            words.append(String(arrWords[i]))
        }
        
        return words
    }
}



// MARK: ================================================================================



let s = Solution().ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
print(s)