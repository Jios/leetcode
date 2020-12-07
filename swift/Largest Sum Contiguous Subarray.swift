Largest Sum Contiguous Subarray
https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/
Write an efficient program to find the sum of contiguous subarray within a one-dimensional array of numbers which has the largest sum.


// sliding windown
func maxSumOfSubelements(_ arr: [Int], _ k: Int) -> Int
{
    if arr.count < k
    {
        return 0
    }

    var maxSum = 0

    for i in 0 ..< k
    {
        maxSum += arr[i]
    }

    var windowSum = maxSum
    for i in k ..< arr.count
    {
        windowSum += arr[i] - arr[i-k]
        maxSum = max(maxSum, windowSum)
    }

    return maxSum
}


let arr = [1, 4, 2, 10, 2, 3, 1, 0, 20]
let maxSum = maxSumOfSubelements(arr, 4)
print("\(maxSum)")
