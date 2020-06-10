// 935. Knight Dialer
// https://leetcode.com/problems/knight-dialer/


class Solution {
    func knightDialer(_ N: Int) -> Int {
        let M = 1000000007
        var arr = Array(repeating:1,count:10)
        
        for i in 1..<N {
            var arr_old = Array(arr)
            
            arr[0] = (arr_old[4] + arr_old[6])%M
            arr[1] = (arr_old[6] + arr_old[8])%M
            arr[2] = (arr_old[7] + arr_old[9])%M
            arr[3] = (arr_old[4] + arr_old[8])%M
            arr[4] = ((arr_old[3] + arr_old[9])%M + arr_old[0] )%M
            arr[5] = 0
            arr[6] = ((arr_old[1] + arr_old[7])%M + arr_old[0] )%M
            arr[7] = (arr_old[2] + arr_old[6])%M
            arr[8] = (arr_old[1] + arr_old[3])%M
            arr[9] = (arr_old[4] + arr_old[2])%M
        }
        
        var result = 0
        for i in 0..<10 {
            result = (result + arr[i])%M
        }
        
        return result
    }
}