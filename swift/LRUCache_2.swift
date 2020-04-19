
class LRUCache {
    
    private var count = 0
    private var capacity = 0
    private var head : doubleNode?
    private var tail : doubleNode?
    private var map : [Int : doubleNode]

    init(_ capacity: Int) {
        map = [Int : doubleNode]()
        
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
       if let node = map[key]{
            addToFront(node) 
            return node.val
         } 
        return -1
    }

    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key]{
            map[key]!.val = value
            addToFront(node)
        } else{
            var temp = doubleNode(key,value)
            count += 1
            if head != nil{
                //add to the front
                temp.next = head
                head!.prev = temp
                head = temp
        
                if count > capacity{
                    let prev = tail?.prev
                    prev?.next = nil
                    
                    //remove tail's value from the hashMap
                    map.removeValue(forKey: tail!.key) 
                    tail = prev
                
                    count -= 1
                }
            } else {
                head = temp
                tail = head
                count = 1
            }
        
            map[key] = temp
        }
        
      
    }
    
    func addToFront(_ node : doubleNode){
        //if it is not the head already
        if head!.key != node.key{
            let prev = node.prev
            let next = node.next
                
            var setNil = false
            if tail!.key == node.key{
                tail = tail!.prev
                setNil = true
            }
             
            node.next = head
            head!.prev = node
            head = node
            node.prev = nil
                
            prev?.next = next
            next?.prev = prev
            if setNil{
                tail!.next = nil
            }
             
        }
            
    }
    
}

public class doubleNode{
    var key : Int
    var val : Int
    var prev : doubleNode?
    var next : doubleNode?
    
    init(_ key : Int,_ value : Int ){
        self.key = key
        val = value
    }
    
    
    
}



/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */