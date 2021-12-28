
T: O(n) S: O(n)
class Solution {
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        var maxDepth = 0
        var resultSum = 0

        findDepth(nestedList,1,&maxDepth)
        findDepthSum2(nestedList,maxDepth,&resultSum)

        return resultSum
    }

       func findDepth(_ nestedList: [NestedInteger],_ currDepth: Int,_ maxDepth: inout Int) {
           maxDepth = max(currDepth, maxDepth)

        for nestedItem in nestedList {
            if !nestedItem.isInteger() {
                findDepth(nestedItem.getList(),currDepth+1,&maxDepth)
            }
        }
    }

    func findDepthSum2(_ nestedList: [NestedInteger],_ currDepth: Int,_ maxSum: inout Int) {

        for nestedItem in nestedList {
            if nestedItem.isInteger() {
                maxSum += nestedItem.getInteger() * currDepth
            } else {
                findDepthSum2(nestedItem.getList(),currDepth - 1, &maxSum)
            }
        }
    }
}
