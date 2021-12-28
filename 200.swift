
T - O ( W * H )
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var maxIslands = 0


        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == "1" {
                    maxIslands += 1
                    dfs(&grid,row,col)
                }
            }
        }


        return maxIslands
    }

    func dfs(_ grid: inout [[Character]],_ row: Int,_ col: Int) {
        guard row >= 0, row < grid.count, col >= 0, col < grid[row].count, grid[row][col] == "1" else { return }

        grid[row][col] = "2"

        dfs(&grid,row-1,col)
        dfs(&grid,row+1,col)
        dfs(&grid,row,col-1)
        dfs(&grid,row,col+1)
    }
}
