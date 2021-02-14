// 19. Remove Nth Node From End of List
// https://leetcode.com/problems/remove-nth-node-from-end-of-list/


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution 
{
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? 
    {
        var dummy = ListNode(0)
        dummy.next = head
        
        var first: ListNode? = dummy
        var second: ListNode? = dummy
        
        for i in 0 ... n
        {
            first = first?.next
        }
        
        while first != nil
        {
            first = first?.next
            second = second?.next
        }
        
        second?.next = second?.next?.next
        
        return dummy.next
    }
}


/*
class Solution 
{
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? 
    {
        var node = head
        
        var numberOfNodes = 0
        
        while node != nil
        {
            numberOfNodes += 1
            node = node?.next
        }
        
        if numberOfNodes == 1
        {
            return nil
        }
        else if numberOfNodes == n
        {
            return head?.next
        }
        
        node = head
        
        let removedIndex = numberOfNodes - n - 1
        
        for i in 0 ... numberOfNodes
        {
            if i == removedIndex
            {
                node?.next = node?.next?.next
                break
            }
            
            print(node?.val)
            node = node?.next
        }
        
        return head
    }
}
// */