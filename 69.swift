
T - O(log n)
class Solution {
    func mySqrt(_ x: Int) -> Int {

        guard x != 0 else { return 0 }

        return binSearch(x,0,x) != nil ? binSearch(x,0,x)! : -1
    }


    func binSearch(_ x: Int, _ low: Int,_ high: Int) -> Int? {
        if low > high { return high }

        var mid = low+(high-low)/2
        let midSq = mid * mid

        if midSq > x {
            return binSearch(x,low,mid-1)
        } else if midSq < x {
            return binSearch(x,mid+1,high)
        } else  {
            return mid
        }
    }
}
