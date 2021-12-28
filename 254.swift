T - O(n logn) Space- logn
class Solution {
    func getFactors(_ n: Int) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        dfs(&res,&path,n,2)
        return res
    }

    func dfs(_ res: inout [[Int]],_ path: inout [Int],_ n: Int,_ start: Int){
        if n == 1 {
            if path.count > 1 {
                res.append((path))
            }
            return
        }
        if start > n {
            return
        }
        print("---")
        print(start)
        print(n)

        for i in start...n where n % i == 0 {
            path.append(i)
            dfs(&res,&path,n/i,i)
            print("bef - \(path)")
            path.removeLast()
            print("aft - \(path)")
        }
    }
}
