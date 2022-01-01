
// T - O(log n)
class Solution {
   func isPerfectSquare(_ num: Int) -> Bool {
       if num == 1 { return true }

       guard num > 2 else { return false }

        var l = 0, h = num/2, mid = 0

        while l <= h {
            mid = (l + h) / 2
            if mid * mid == num { return true }
            else if mid * mid > num {
                h = mid - 1
            } else {
                l = mid + 1
            }
        }

        return false
    }
}
