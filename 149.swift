Slope = (y2 - y1) / (x2-x1)

T - O(n ^ 2)

class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {

        // 2 point always on the same line
        if points.count < 3 {
            return points.count
        }

        var ans = 0
        for i in 0..<points.count {
            let p1 = points[i]
            var slopeDict:[Double:Int] = [:]
            for j in i+1..<points.count {
                let p2 = points[j]
                let slope = getSlope(p1, p2)

                slopeDict[slope, default:0] += 1
                ans = max(ans, slopeDict[slope, default:0] + 1) // add +1 to count p1
            }
        }

        return ans
    }

    func getSlope(_ a:[Int], _ b:[Int]) -> Double {
        // both points on the same x
        if a[0] == b[0] { return Double.greatestFiniteMagnitude }

        // both points on the same y
        if a[1] == b[1] { return 0 }

        return Double(a[1] - b[1]) / Double(a[0] - b[0])
    }
}
