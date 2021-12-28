T - O(n) S - (1)

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var count = 0
        for idx in 0..<flowerbed.count {
            if (idx == 0 || flowerbed[idx-1] == 0), (idx == flowerbed.count-1 || flowerbed[idx+1] == 0) {
                if flowerbed[idx] == 0 {
                    flowerbed[idx] = 1
                    count += 1
                }  
            }
        }

        return count >= n
    }
}
