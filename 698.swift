
T - k * 2 ^ n S - O(n)
class Solution {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        var total = 0
        for num in nums{
            total += num
        }
        if total % k != 0 { return false }
        total = total / k
        var visited:[Bool] = Array(repeating: false, count: nums.count)
        return helper(nums, &visited, 0, k, total, total)
    }

    func helper(_ nums: [Int],_ visited:inout[Bool],_ start:Int,_ k:Int,_ curr:Int, _ total:Int)->Bool{
        if k == 1 { return true }
        if curr == 0 { return helper(nums, &visited, 0, k-1, total, total)}
        for i in start..<nums.count{
            if !visited[i] {
                visited[i] = true
                if helper(nums, &visited, i+1, k, curr-nums[i], total){
                    return true
                }
                visited[i] = false
            }
        }
        return false
    }
}
