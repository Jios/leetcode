// https://leetcode.com/problems/reverse-nodes-in-k-group/

let node: ListNode? = ListNode(-1)
var tmp = node

for n in [1,2,3,4,5]
{
    tmp?.next = ListNode(n)
    tmp = tmp?.next
}

let s = Solution()
var head = s.reverseKGroup(node?.next, 2)

while head != nil
{
    print(head?.val)
    head = head?.next
}



// MARK: ===============================================================



// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution 
{
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode?
    {
        guard head != nil else {
            return nil
        }
        
        var node = head
        var startNode = node
        
        var count = 0
        
        var newHead: ListNode?
        
        while node != nil
        {
            count += 1
            
            if count == k
            {
                var revHead = startNode
                var ktail = node
                
                startNode = node?.next
                
                var next = node?.next
                
                while count > 1
                {
                    print("\(count): \(revHead!.val) <~> \(ktail!.val)")
                    
                    let tmp = revHead?.next
                    revHead?.next = next
                    next = revHead
                    revHead = tmp
                    
                    count -= 1
                }
                
                // revHead?.next = ktail?.next
                ktail?.next = revHead
                
                if newHead == nil
                {
                    newHead = revHead
                }
                
                node = startNode
                count = 0
            }
            else
            {
                node = node?.next
            }
            
            print(node?.val)
        }
        
        return newHead ?? head
    }
}