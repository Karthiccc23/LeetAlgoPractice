


T - O(w * h)
class Solution {
    public static final char EMPTY = '0';
    public static final char ENEMY = 'E';
    public static final char WALLX = 'W';
    int m, n;
    public int maxKilledEnemies(char[][] grid) {
        this.m = grid.length;
        this.n = grid[0].length;
        int rowCount = 0;
        int colCount[] = new int[n];
        int max = 0;
        // this is kind of dp
        // but no need to save a 2D array
        // you do need a oneD array since the column loop variable
        // is going to change in the routine for row, for col loop
        // and also need to recalculate anytime you encounter a wall
        // in previous position row or col
        // it is only O(m*n) -- since each cell is visited only once
        // space is O(n)
        for(int i = 0; i < m; i++){
            for(int j = 0; j < n; j++){
                if (j == 0 || grid[i][j-1] == WALLX){
                    rowCount = countRow(i, j, grid);
                }
                if (i == 0 || grid[i-1][j] == WALLX){
                    colCount[j] = countCol(i, j, grid);
                }
                if (grid[i][j] == EMPTY){
                    int killed = rowCount + colCount[j];
                    max = Math.max(max, killed);
                }
            }
        }
        return max;
    }
    private int countRow(int u, int v, char[][] grid){
        int rcnt = 0;
        for(int j = v; j < n; j++){
            if (grid[u][j] == WALLX)
                break;
            else if (grid[u][j] == ENEMY)
                rcnt++;
        }
        return rcnt;
    }
    private int countCol(int u, int v, char[][] grid){
        int ccnt = 0;
        for(int i = u; i < m; i++){
            if (grid[i][v] == WALLX)
                break;
            else if (grid[i][v] == ENEMY)
                ccnt++;
        }
        return ccnt;
    }
}
