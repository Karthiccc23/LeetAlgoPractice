
// Fast power T - O (log n)
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var x = x, n = n, res = 1.0

        if n < 0 { x = 1.0/x ; n = -n }

        while n > 0 {
            if n % 2 != 0 { res *= x }
            x *= x
            n /= 2
        }
        return res
    }
}
