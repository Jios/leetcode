// 83. Remove Duplicates from Sorted List
// https://leetcode.com/problems/remove-duplicates-from-sorted-list/


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
    func deleteDuplicates(_ head: ListNode?) -> ListNode?
    {
        guard head != nil else {
            return head
        }
        
        var node = head
        
        while node?.next != nil
        {
            if node?.val == node?.next?.val
            {
                node?.next = node?.next?.next
            }
            else
            {
                node = node?.next
            }
        }
        
        return head
    }
}