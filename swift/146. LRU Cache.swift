// 146. LRU Cache
// https://leetcode.com/problems/lru-cache/


class LRUCache 
{
    // Stacks LIFO
    // Queues FIFO
    var queue: [Int] = []
    var hash: [Int: Int] = [:]
    var capacity: Int
    
    init(_ capacity: Int) 
    {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int 
    {
        guard let value = hash[key] else {
            return -1
        }
        
        // remove value from queue
        removeFromQueue(key)
        
        // insert value back to queue
        queue.insert(key, at: 0)
        
        return value
    }
    
    func put(_ key: Int, _ value: Int) 
    {
        // found existing key
        if get(key) != -1
        {
            // remove value from queue
            removeFromQueue(key)
            hash.removeValue(forKey: key)
        }
        
        // check capacity
        if hash.keys.count >= capacity
        {
            // pop queue
            if let removingKey = queue.popLast()
            {
                hash.removeValue(forKey: removingKey)
            }
        }
        
        // insert value into queue
        queue.insert(key, at: 0)
        
        hash[key] = value
    }
    
    private func removeFromQueue(_ key: Int)
    {
        if let index = queue.firstIndex(of: key)
        {
            queue.remove(at: index)
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */