
T: O(n) S: O(n)
class Solution {
    func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {



        var fIdx = -1
        var sIdx = -1
        var minDistance = Int.max

        for idx in 0..<wordsDict.count {
            if wordsDict[idx] == word1 {
                fIdx = idx
            }

            if wordsDict[idx] == word2 {
                sIdx = idx
            }

            if fIdx != -1 && sIdx != -1 {
                var currDistance = abs(fIdx-sIdx)
                minDistance = min(currDistance, minDistance)
            }
        }

        return minDistance
    }
}
