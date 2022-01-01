
// T - O (n^2)
class Solution {
    func minInsertions(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: n), count: n)

        return longestPalindromeSubseq(chars, 0, n - 1, &memo)
    }



    private func longestPalindromeSubseq(_ chars: [Character], _ start: Int, _ end: Int, _ memo: inout [[Int?]]) -> Int {
        if let val = memo[start][end] {
            return val
        }

        if start == end {
            return 0
        } else if start > end {
            return 0
        }

        let res: Int

        if chars[start] == chars[end] {
            res = longestPalindromeSubseq(chars, start + 1, end - 1, &memo)
        } else {
            res = min(longestPalindromeSubseq(chars, start, end - 1, &memo), longestPalindromeSubseq(chars, start + 1, end, &memo)) + 1
        }

        memo[start][end] = res
        return res
    }
}
