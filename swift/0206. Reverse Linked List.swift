// 206. Reverse Linked List
// https://leetcode.com/problems/reverse-linked-list/


class Solution 
{
    func reverseList(_ head: ListNode?) -> ListNode? 
    {
        var current = head
        var previous: ListNode?
        
        while current != nil
        {
            var nextTmp = current?.next
            
            current?.next = previous
            previous = current
            
            current = nextTmp
        }
        
        return previous
    }
}