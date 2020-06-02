// 876. Middle of the Linked List
// https://leetcode.com/problems/middle-of-the-linked-list/submissions/


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? 
    {
        var slow = head, fast = head
        
        while fast != nil && fast?.next?.next != nil
        {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var tmp = head
        var count = 0
        
        while tmp != nil
        {
            tmp = tmp?.next
            count += 1
        }
        
        if count % 2 == 0
        {
            return slow?.next
        }
        
        return slow
    }
}