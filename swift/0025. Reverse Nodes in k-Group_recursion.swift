// 25. Reverse Nodes in k-Group
// https://leetcode.com/problems/reverse-nodes-in-k-group/


class Solution 
{    
    // recursively solve the problem
    // find k nodes in a group, if less than k nodes left, we just return head
    // -> cur = head, count = 1
    // -> while count <= k to iterate, check first if cur == nil { return head }
    // reverse k nodes starting head
    // -> pre = reverseKGroup(cur, k)
    // -> while count <= k to iterate and return pre finally
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? 
    {
        var cur = head, count = 1

        while count <= k 
        {
            if cur == nil 
            {
                return head
            }
            cur = cur?.next
            count += 1
        }
        
        var pre = reverseKGroup(cur, k)
        cur = head; count = 1

        while count <= k 
        {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
            count += 1
        }
        
        return pre
    }
}