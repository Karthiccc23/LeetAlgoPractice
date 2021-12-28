
T - O(n)
class Solution {
  func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var charsS = Array(s)
        var charsT = Array(t)
        var map = [Character: Character]()

        if charsS.count != charsT.count {
            return false
        }

        for i in 0..<charsS.count {
            let charS = charsS[i]
            let charT = charsT[i]
            if let value = map[charS] {
                if value == charT {
                    continue
                } else {
                    return false
                }
            } else {
                if map.values.contains(charT) {
                    return false
                } else {
                    map[charS] = charT
                }
            }
        }

        return true
    }
}
