
T- O(n) S - 1
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
                if nums.isEmpty {
            return Int.min
        }
        var maxValue = nums[0]
        var preMax = nums[0]
        for i in 1..<nums.count {
            let value = nums[i]
            print("preMax = \(preMax)")
            print("-----")
            let curMax = max(preMax + value, value)
            print("curMax = \(curMax)")
            maxValue = max(maxValue, curMax)
            print("maxvalue = \(maxValue)")
            preMax = curMax
        }
        return maxValue
    }
}
