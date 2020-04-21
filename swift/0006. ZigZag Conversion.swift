// 6. ZigZag Conversion
// https://leetcode.com/problems/zigzag-conversion/

class Solution 
{
  func convert(_ s: String, _ numRows: Int) -> String 
  {
    var matrix: [[Character]] = []

    for i in 0 ..< matrix.count
    {
      matrix[i] = []
    }

    var r = 0
    var sign = 1
    for c in s
    {
     matrix[r].append(c)

     if r  >= numRows - 1
     {
      sign = -1
    }
    else if r < 0
    {
      sign = 1
    }

    r += sign	// r = 1
  }

  var ans = ""

  for row in matrix 	// [Character]
  {
  	ans += String(row)
  }
  return ans
}
}
