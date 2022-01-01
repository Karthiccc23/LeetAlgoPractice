
 // T-  n ^ 2 S - log n
class Solution {
     func triangleNumber(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        let count = sorted.count
        var result = 0

        for c in stride(from: count - 1, through: 2, by: -1) {
            var a = 0, b = c - 1
            while a < b {
                if sorted[a] + sorted[b] > sorted[c] {
                    result += b - a
                    b -= 1
                } else {
                    a += 1
                }
            }
        }

        return result
    }
}
