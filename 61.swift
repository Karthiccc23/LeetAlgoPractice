
// T - O(n)
func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
     if head == nil {
         return head
     }
     // To get length of list
     var length = 1
     // To find tail of list
     var tail : ListNode? = head

     while tail?.next !=  nil {
         length += 1
         tail = tail?.next
     }
     // if K == length in that case we have to rotate entire list to return same original list
     var k =  k % length
     if k == 0 {
         return head
     }

     // Steps to find new head will be length - k
     var stepsToNewHead = length - k

     // Connet Tail to head to form cycle list
     tail?.next = head

     // Find New tail after rotating stepsToNewHead th time
     var newTail = tail

     while stepsToNewHead > 0 {
         stepsToNewHead -= 1
         newTail = newTail?.next
     }
     // New head
     let newHead = newTail?.next
     // Break cycle
     newTail?.next = nil

     return newHead
 }
