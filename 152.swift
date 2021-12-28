
T - O(n)
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
          if (nums.count == 0) {
                 return 0
             }

    var maxherepre = nums[0]
    var minherepre = nums[0]
    var maxsofar = nums[0]
    var maxhere = 1
    var minhere = 1

    for i in 1..<nums.count {
        maxhere = max(max(maxherepre * nums[i], minherepre * nums[i]),  nums[i])
        minhere = min(min(maxherepre * nums[i], minherepre * nums[i]),  nums[i])
        print(maxhere)
        print(minhere)
        maxsofar = max(maxhere, maxsofar)
        maxherepre = maxhere
        minherepre = minhere
    }
    return maxsofar
    }
}
