// https://leetcode.com/problems/max-stack/

/*

class MaxStack 
{
    var stack: [Int]
    var maxStack: [Int]
    
    init() 
    {
        stack = [Int]()
        maxStack = [Int]()
    }
    
    func push(_ x: Int) 
    {
        if maxStack.isEmpty
        {
            maxStack.append(x)
        }
        else if let val = maxStack.last
        {
            maxStack.append(max(val, x))
        }
        
        stack.append(x)
    }
    
    func pop() -> Int 
    {
        maxStack.removeLast()
        
        let val = stack.removeLast()
        return val
    }
    
    func top() -> Int 
    {
        return stack[stack.count - 1]
    }
    
    func peekMax() -> Int 
    {
        return maxStack[maxStack.count - 1]
    }
    
    func popMax() -> Int 
    {
        var arr = [Int]()
        
        let max = peekMax()
        
        // pop
        while top() != max
        {
            arr.append(pop())
        }
        
        pop()
        
        // push
        while !arr.isEmpty
        {
            push(arr.removeLast())
        }
        
        return max
    }
}

*/


/**
 * Your MaxStack object will be instantiated and called as such:
 * let obj = MaxStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.peekMax()
 * let ret_5: Int = obj.popMax()
 */





class Node 
{
    let val: Int
    var prev: Node?
    var next: Node?
    
    init(val: Int, prev: Node? = nil, next: Node? = nil)
    {
        self.val = val
        self.prev = prev
        self.next = next
    }
}


class MaxStack 
{
    // stack
    private var head: Node
    private var tail: Node
    
    // max stack
    private var maxHead: Node
    private var maxTail: Node
    
    private var hash: [Int: [(node: Node, maxNode: Node)]]
    
    init() 
    {
        head = Node(val: Int.min)
        tail = Node(val: Int.max)
        
        head.next = tail
        tail.prev = head
        
        maxHead = Node(val: Int.min)
        maxTail = Node(val: Int.max)
        
        maxHead.next = maxTail
        maxTail.prev = maxHead
        
        hash = [:]
    }
    
    func push(_ x: Int) 
    {
        // append element
        
        let node = Node(val: x)
        let maxNode = Node(val: x)
        
        push(node: node)
        push(max: maxNode)
        
        hash[x, default: []].append((node: node, maxNode: maxNode))
        
        // printNodes(head: head)
        // printNodes(head: maxHead)
        // print(hash)
    }
    
    func pop() -> Int 
    {
        // pop and return last element
        
        return pop(val: lastNode?.val)
    }
    
    func top() -> Int 
    {
        // return last element
        
        return lastNode?.val ?? -1
    }
    
    func peekMax() -> Int 
    {
        // return max element
        
        return maxNode?.val ?? -1
    }
    
    func popMax() -> Int 
    {
        // pop and return max element
        
        return pop(val: maxNode?.val)
    }
}


// MARK: - unordered doubly linked list

fileprivate
extension MaxStack
{
    func pop(val: Int?) -> Int
    {
        guard let val = val, let (node, maxNode) = hash[val]?.removeLast() else {
            return -1
        }
        
        delete(node: node)
        delete(node: maxNode)
        
        return val
    }
    
    func delete(node: Node)
    {
        node.next?.prev = node.prev
        node.prev?.next = node.next
    }
    
    func printNodes(head node: Node?)
    {
        var arr: [Int] = []
        var node = node
        
        while node != nil
        {
            arr.append(node!.val)
            node = node?.next
        }
        
        print(arr)
    }
}


fileprivate
extension MaxStack
{
    var lastNode: Node? {
        return tail.prev
    }
    
    func push(node: Node)
    {
        node.next = tail
        node.prev = tail.prev
        
        tail.prev?.next = node
        tail.prev = node
    }
}


// MARK: - ordered doubly linked list

fileprivate
extension MaxStack
{
    var maxNode: Node? {
        return maxTail.prev
    }
    
    func insert(node: Node, after head: Node)
    {
        node.prev = head
        node.next = head.next
        
        head.next?.prev = node
        head.next = node
    }
    
    func insert(node: Node, before tail: Node)
    {
        node.prev = tail.prev
        node.next = tail
        
        tail.prev?.next = node
        tail.prev = node
    }
    
    /*
    func push(max node: Node)
    {
        var tmp: Node? = maxHead
        
        while tmp != nil, tmp!.val < node.val
        {
            tmp = tmp?.next
        }
        
        node.prev = tmp?.prev
        node.next = tmp
        
        tmp?.prev?.next = node
        tmp?.prev = node
    }
    */
    
    func push(max node: Node)
    {
        var next: Node? = maxHead
        var prev: Node? = maxTail
        
        while next != nil, prev != nil
        {
            if node.val <= next!.val
            {
                // insert before next
                insert(node: node, before: next!)
                
                break
            }
            else if node.val >= prev!.val
            {
                // insert after prev
                insert(node: node, after: prev!)
                
                break
            }
            
            next = next?.next
            prev = prev?.prev
        }
    }
}  
