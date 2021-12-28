

T - O(k) k - valid permutation S - O(n) depth of recursion tree
class Solution {
    var count = 0

    func countArrangement(_ n: Int) -> Int {
        var nums = [Int]()
        var perms = [[Int]]()
        for idx in 1...n {
            nums.append(idx)
        }

        print(nums)

        permHelper(0,&nums,&perms)
        print(perms)

        return count
    }


    func permHelper(_ index: Int,_ nums: inout [Int],_ perms: inout [[Int]]) {
        if index == nums.count {
            count += 1
        }

        for j in index..<nums.count {
            swap(index,j,&nums)
            if (index+1) % nums[index] == 0 || nums[index] % (index+1) == 0 {
             permHelper(index+1,&nums,&perms)
            }
            swap(index,j,&nums)
        }

    }

    func swap(_ i: Int,_ j: Int,_ nums: inout [Int]) {
        var temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }
}
