

T - O(n^2)
class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
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
            return 1
        } else if start > end {
            return 0
        }

        let res: Int

        if chars[start] == chars[end] {
            res = longestPalindromeSubseq(chars, start + 1, end - 1, &memo) + 2
        } else {
            res = max(longestPalindromeSubseq(chars, start, end - 1, &memo), longestPalindromeSubseq(chars, start + 1, end, &memo))
        }

        memo[start][end] = res
        return res
    }
}

class Solution {
     func longestPalindromeSubseq(_ s: String) -> Int {
        let s = Array(s)
        var dp = Array(repeating:Array(repeating:0, count:s.count), count:s.count)

        for i in stride(from:s.count-1,through:0,by:-1) {
            dp[i][i] = 1
            for j in i+1..<s.count {
                dp[i][j] = s[i] == s[j] ? (dp[i+1][j-1] + 2) : (max(dp[i+1][j],dp[i][j-1]))
            }
        }

        return dp.first?.last ?? 0
    }
}
