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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?
    {
        var l1 = l1
        var l2 = l2
        
        var tmp: ListNode? = ListNode(-1)
        let root: ListNode? = tmp
        
        while let v1 = l1?.val
            , let v2 = l2?.val
        {
            if v1 <= v2
            {
                tmp?.next = l1
                l1 = l1?.next
            }
            else
            {
                tmp?.next = l2
                l2 = l2?.next
            }
            tmp = tmp?.next
        }
        
        if l1 != nil
        {
            tmp?.next = l1
        }
        else if l2 != nil
        {
            tmp?.next = l2
        }
        
        return root?.next
    }
}
