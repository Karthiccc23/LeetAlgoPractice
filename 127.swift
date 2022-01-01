
// word length * number of words

// T - O(M ^ 2 * N)
class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {

        var hash = [String: [String]]()

        for word in wordList {

            for i in 0..<beginWord.count {

                var w = Array(word)
                w[i] = "*"

                hash[String(w), default: [String]()].append(word)
            }
        }
        print(hash)

        var q = [(word: String, level: Int)]()
        var visited = Set<String>()

        q.append((beginWord, 1))
        visited.insert(beginWord)

        while !q.isEmpty {

            let (word, level) = q.removeFirst()

            for i in 0..<beginWord.count {

                var w = Array(word)
                w[i] = "*"

                let words = hash[String(w), default: [String]()]

                if words.contains(endWord) {
                    return level + 1
                }

                for word in words {
                    if !visited.contains(word) {
                        q.append((word, level + 1))
                        visited.insert(word)
                    }

                }
            }
        }

        return 0
    }
}
