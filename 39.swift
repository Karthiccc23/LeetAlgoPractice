Let NNN be the number of candidates, TTT be the target value, and MMM be the minimal value among the candidates.
T - O(N ^ T/M​ + 1)   S - O(T/M)
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var currC = [Int]()
        dfs(0,candidates,&currC,&result,target,0)

        print(result)
        return result
    }


    func dfs(_ index: Int,_ candidates: [Int],_ currC: inout [Int],_ result: inout [[Int]],_ target: Int,_ currSum: Int) {
        if currSum == target {
            result.append(currC)
        } else if currSum > target {
            return
        }


        for j in index..<candidates.count {
            currC.append(candidates[j])
            var cSum = currSum + candidates[j]
            dfs(j,candidates,&currC,&result,target,cSum)
            currC.removeLast()
        }
    }
}
