// 208. Implement Trie (Prefix Tree)
// https://leetcode.com/problems/implement-trie-prefix-tree/


class Node
{
    var links: [Node?] = Array(repeating: nil, count: 26)
    var isEnd = false
    
    private
    func char2Int(_ char: Character) -> Int
    {
        return Int(char.asciiValue! - Character("a").asciiValue!)
    }
}


extension Node
{
    func contains(_ char: Character) -> Bool
    {
        let idx = char2Int(char)
        return links[idx] != nil
    }
    
    func get(_ char: Character) -> Node?
    {
        let idx = char2Int(char)
        return links[idx]
    }
    
    func put(_ char: Character)
    {
        let idx = char2Int(char)
        links[idx] = Node()
    }
}



class Trie 
{
    var root: Node
    /** Initialize your data structure here. */
    init() 
    {
        root = Node()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) 
    {
        var node = root
        
        word.forEach { c in
                      if !node.contains(c)
                      {
                          node.put(c)
                      }
                      node = node.get(c)!
        }
        
        node.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool 
    {
        var node = root
        
        for c in word
        {
            if !node.contains(c)
            {
                return false
            }
            
            node = node.get(c)!
        }
        
        return node.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool 
    {
        var node = root
        
        for c in prefix
        {
            if !node.contains(c)
            {
                return false
            }
            
            node = node.get(c)!
        }
        
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */