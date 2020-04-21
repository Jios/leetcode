// 25. Reverse Nodes in k-Group
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
        guard let head = head else {
            return nil
        }

        if k < 2
        {
            return head
        }

        var dummy = ListNode(0)
        
        dummy.next = head
        
        var current = dummy

        while current.next != nil 
        {
            var start = current.next
            var end = current.next
            
            var count = 1
            while count < k && end != nil
            {
                end = end!.next
                count += 1
            }
            
            if end == nil
            {
                break
            }
            
            //next keep track for head of remaing list
            var next = end!.next
            
            //break the chain to reverse the k elements
            end!.next = nil
            
            var tCurr = start
            var prev:ListNode? = nil

            while tCurr != nil
            {
                let tNext = tCurr!.next
                tCurr!.next = prev
                prev = tCurr!
                tCurr = tNext
            }
            
            
            //after reversing. Put the conenction back
            
            current.next = end
            
            start!.next = next
            
            //start next iteration
            current = start!
            
        }
        return dummy.next
    }
}