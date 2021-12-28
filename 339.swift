
T: O(n) S: O(n)
class Solution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var maxSum = 0


        findDepthSum(nestedList,1,&maxSum)

        return maxSum
    }

    func findDepthSum(_ nestedList: [NestedInteger],_ currDepth: Int,_ maxSum: inout Int) {

        for nestedItem in nestedList {
            if nestedItem.isInteger() {
                maxSum += currDepth * nestedItem.getInteger()
            } else {
                findDepthSum(nestedItem.getList(),currDepth+1,&maxSum)
            }
        }
    }
}
