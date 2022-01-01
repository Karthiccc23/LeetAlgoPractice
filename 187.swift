
T - O (N)
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count >= 10 else { return [] }

        var maxStr = ""
        var maxCount = Int.min

        var result = [String]()

        var arrStr = Array(s)
        var start = 0
        var right = 9
        var dict = [String: Int]()
        while right < arrStr.count {
          var currStr = String(arrStr[start...right])
          dict[currStr, default: 0] += 1

          right += 1
          start += 1
        }

        for (k,v) in dict {
            if v > 1 {
                result.append(k)
            }
        }

        return result
    }
}
