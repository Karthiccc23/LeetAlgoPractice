
T - k log k
class Solution {


    struct Pair {
        var left: Int
        var right: Int
        var index: Int
        var sum: Int

        init(_ left: Int, _ right: Int, _ index: Int) {
            self.left = left
            self.right = right
            self.sum = left + right
            self.index = index
        }
    }


    class PriorityQueue {
        private var arr = [Pair]()

        var arrLog: [[Int]] {
            return arr.map({[$0.left, $0.right, $0.index]})
        }

        var pull: Pair? {
            return arr.first
        }

        var isEmpty: Bool {
            return arr.isEmpty
        }

        func pop() -> Pair {
            let temp = arr.first!
            arr[0] = arr.last!
            arr.removeLast()
            heapifyTowDown(0)
            return temp
        }

        func insert(_ pair: Pair) {
            arr.append(pair)
            heapifyBottomUp(arr.count - 1)
        }

        private func heapifyBottomUp(_ index: Int) {
            if index == 0 {
                return
            }

            if arr[parentIndex(index)].sum > arr[index].sum {
                swap(parentIndex(index), index)
                heapifyBottomUp(parentIndex(index))
            }
        }

        private func heapifyTowDown(_ index: Int) {
            if index >= arr.count {
                return
            }

            let leftChildIndex = leftChild(index)
            let rightChildIndex = rightChild(index)

            if rightChildIndex < arr.count {
                if arr[leftChildIndex].sum <= arr[rightChildIndex].sum && arr[leftChildIndex].sum < arr[index].sum {
                    swap(leftChildIndex, index)
                    heapifyTowDown(leftChildIndex)
                } else if arr[rightChildIndex].sum < arr[index].sum {
                    swap(rightChildIndex, index)
                    heapifyTowDown(rightChildIndex)
                }
            } else if leftChildIndex < arr.count && arr[leftChildIndex].sum < arr[index].sum {
                swap(leftChildIndex, index)
                heapifyTowDown(leftChildIndex)
            }
        }

        private func swap(_ indexOne: Int, _ indexTwo: Int) {
            let temp = arr[indexOne]
            arr[indexOne] = arr[indexTwo]
            arr[indexTwo] = temp
        }

        private func parentIndex(_ index: Int) -> Int {
            return (index - 1)/2
        }

        private func leftChild(_ index: Int) -> Int {
            return 2 * index + 1
        }

        private func rightChild(_ index: Int) -> Int {
            return 2 * index + 2
        }
    }


    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var res = [[Int]]()

        if nums1.isEmpty || nums2.isEmpty {
            return []
        }

        var queue = PriorityQueue()

        for i in 0..<count {
            var pair = Pair(nums1[i], nums2[0], 0)
            queue.insert(pair)
        }

        var k = k
        while k > 0 && !queue.isEmpty {
            k -= 1
            let current = queue.pop()
            res.append([current.left, current.right])
            if current.index == nums2.count - 1 {continue}
            queue.insert(Pair(current.left, nums2[current.index + 1], current.index + 1))
        }

        return res
    }
}
