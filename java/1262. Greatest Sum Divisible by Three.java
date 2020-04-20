// 1262. Greatest Sum Divisible by Three
// https://leetcode.com/problems/greatest-sum-divisible-by-three/

class Solution 
{
    public int maxSumDivThree(int[] A) 
    {
        int n = A.length;
        int[][] dp = new int[n+1][3];

        for(int i = 1; i <= n; i++) 
        {
            for(int j = 0; j < 3; j++) 
            {
                dp[i][j] = dp[i-1][j];

                int t = (j - A[i-1] % 3 + 3) % 3;

                if(dp[i-1][t] != 0 || A[i-1] % 3 == j) 
                {
                    dp[i][j] = Math.max(dp[i][j], dp[i-1][t] + A[i-1]);
                    //System.out.println("i " + i + " j " + j + ": "+ dp[i][j]);
                }
            }
        }

        return dp[n][0];
    }
}