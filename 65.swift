
T - O(n) S - 1
class Solution {
    func isNumber(_ s: String) -> Bool {
        var seenSign = false
        var seenDot = false
        var seenE = false
        var seenDigit = false

        for c in s {
            switch c {
            case "+", "-":
                if seenSign {
                    return false
                }
                seenSign = true
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                seenDigit = true
                seenSign = true
            case "e", "E":
                if !seenDigit || seenE {
                    return false
                }
                seenE = true
                seenDigit = false
                seenSign = false
                seenDot = true
            case ".":
                if seenDot || seenE {
                    return false
                }
                seenDot = true
                seenSign = true
            default:
                return false
            }
        }

        return seenDigit
    }
}
