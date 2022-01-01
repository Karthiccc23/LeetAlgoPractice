
// T - log N
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var start = 0
        var end = nums.count - 1

        while start <= end {
            var mid = start +  (end - start) / 2

            if nums[mid] == target {
                return true
            } else if nums[start] < nums[mid] {
                if target >= nums[start] && target <= nums[mid] {
                    end = mid - 1
                } else {
                    start = mid + 1
                }

            }  else if (nums[mid] < nums[start]) {
                if (target <= nums[end] && target >= nums[mid]) {
                    start = mid + 1}
                else{ end = mid - 1;}
            }  else {
                start += 1
            }
        }


        return false
    }
}
