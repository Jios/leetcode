// 273. Integer to English Words
// https://leetcode.com/problems/integer-to-english-words/


/*
Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.

Example 1:

Input: 123
Output: "One Hundred Twenty Three"
Example 2:

Input: 12345
Output: "Twelve Thousand Three Hundred Forty Five"
Example 3:

Input: 1234567
Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
Example 4:

Input: 1234567891
Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
*/


class Solution 
{
    let hash: [Int: String] = [1: "One",
                              2: "Two",
                              3: "Three",
                              4: "Four",
                              5: "Five",
                              6: "Six",
                              7: "Seven",
                              8: "Eight",
                              9: "Nine",
                              10: "Ten",
                              100: "Hundred",
                              1000: "Thousand",
                              1000000: "Million",
                              1000000000: "Billion"]
    
    func numberToWords(_ num: Int) -> String 
    {
        var ans: String = ""
        var track = 1
        var num = num
        
        while num > 0
        {
            
        }
        
        return ans
    }
}