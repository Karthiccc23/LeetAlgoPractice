T - O (n * n!) S - O(n * n!)
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
       var result = [[Int]]()

        var nums = nums

       getPermutations(&nums, &result,0)

        return result
    }


    func getPermutations(_ nums: inout [Int], _ result: inout [[Int]],_ start: Int) {
        if start == nums.count - 1 {
            result.append(nums)
        } else {
             for idx in start..<nums.count {
                swap(start,idx,&nums)
                getPermutations(&nums,&result,start+1)
                swap(start,idx,&nums)
            }
        }
    }



    func swap(_ i: Int,_ j: Int,_ nums: inout [Int]) {
        var temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }
}
