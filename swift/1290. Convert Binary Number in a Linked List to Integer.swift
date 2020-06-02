// 1290. Convert Binary Number in a Linked List to Integer
// https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer/


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
class Solution 
{
    func getDecimalValue(_ head: ListNode?) -> Int 
    {
        var ans = 0
        var head = head
        
        while let node = head
        {
            if node.val == 0
            {
                ans = ans * 2
            }
            else
            {
                ans = ans * 2 + 1
            }
            
            head = head?.next
        }
        
        return ans
    }
}