T - O(n)

class Solution {
    func myAtoi(_ str: String) -> Int {
        let trimmed = Array(str.trimmingCharacters(in: .whitespaces))
        var result = 0
        var sign = 1
        var index = 0

        for (index, char) in trimmed.enumerated() {
            if index == 0 {
                if char == "-" || char == "+" {
                    sign = char == "-" ? -1 : 1
                    continue
                }
            }

            if let digit = Int(String(char)) {
                if (result > Int32.max / 10) || (result == Int32.max / 10 && digit > Int.max % 10) {
                    return sign == -1 ? Int(Int32.min) : Int(Int32.max)
                }

                result = 10 * result + digit
            } else {
                break
            }
        }

        return result * sign
    }
}
