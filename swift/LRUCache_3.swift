class DoublyLinkedListNode {
    
    var next: DoublyLinkedListNode? = nil
    var prev: DoublyLinkedListNode? = nil
    
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
}

class DoublyLinkedList {
    
    var head: DoublyLinkedListNode?
    var tail: DoublyLinkedListNode?
    
    var description: String {
        var str: String = ""
        
        var node: DoublyLinkedListNode? = head
        while node != nil {
            str += node!.value.description
            node = node?.next
        }
        
        return str
    }
    
    init(node: DoublyLinkedListNode?) {
        self.head = node
        self.tail = node
    }
    
    func append(_ node: DoublyLinkedListNode) {
        node.prev = nil
        node.next = nil
        // print("Appending to " + self.description)
        if self.head == nil {
            self.head = node
            self.tail = node
        } else {
            // print("Tail: " + (self.tail?.value.description ?? "--"))
            self.tail?.next = node
            node.prev = self.tail
            self.tail = node
        }
    }
    
    func remove(_ node: DoublyLinkedListNode) {
        var prev = node.prev
        var next = node.next
        
        if let head = self.head, head === node {
            self.head = next
        }
        
        if let tail = self.tail, tail === node {
            self.tail = prev
        }
        
        prev?.next = next
        next?.prev = prev
        
        node.prev = nil
        node.next = nil
        
    }
    
}

class LRUCache {
    
    var cache: [Int: Int] = [:]
    let capacity: Int
    
    var freqCounter: [Int] = []
    var freqList: DoublyLinkedList = DoublyLinkedList(node:nil)
    var freqMap: [Int: DoublyLinkedListNode] = [:]
    
    var hasReachedCapacity: Bool {
        return cache.keys.count == capacity
    }

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let value = self.cache[key] else { return -1 }
        
        // Lookup key in freqCounter, append it to the end
        if let index = self.freqMap[key] {
            // self.freqCounter.remove(at: index)
            // self.freqCounter.append(key)
            // print("Before: " + self.freqList.description)
            self.freqList.remove(index)
            self.freqList.append(index)
            // print("After: " + self.freqList.description)
            // self.freqMap[key] = self.freqCounter.count - 1
        }

        return value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let existingValue = self.cache[key] {
            self.cache[key] = value
            if let index = self.freqMap[key] {
                self.freqList.remove(index)
                self.freqList.append(index)
                // self.freqCounter.remove(at:index)
                // self.freqCounter.append(key)
                // self.freqMap[key] = self.freqCounter.count - 1
            }

            return
        }
        
        // Check if cache was exceeded capacity
        guard self.hasReachedCapacity else {
            self.insert(key, value)
            return
        }
        
        // Evict item if needed
        // guard let lruKey = self.freqCounter.first else { return }
        guard let lruNode = self.freqList.head else { return }
        let lruKey = lruNode.value
        // print("Removing " + lruKey.description + " from: " + self.freqList.description)
        self.freqList.remove(lruNode)
        // self.freqCounter.remove(at: 0)
        self.freqMap.removeValue(forKey: lruKey)
        self.cache.removeValue(forKey:lruKey)

        // Insert item into cache
        self.insert(key, value)
    }

    func insert(_ key: Int, _ value: Int) {
        self.cache[key] = value
        let node = DoublyLinkedListNode(value:key)
        self.freqList.append(node)
        self.freqMap[key] = node
        
        // print(self.freqList.description)
        // self.freqCounter.append(key)
        // self.freqMap[key] = self.freqCounter.count - 1
    }
    
    
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
