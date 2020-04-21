// 1262. Greatest Sum Divisible by Three
// https://leetcode.com/problems/greatest-sum-divisible-by-three/

class Solution 
{
    func maxSumDivThree(_ nums: [Int]) -> Int 
    {
        var min1 = Bucket()
        var min2 = Bucket()
        var sum = 0
        
        for n in nums 
        {
            if n % 3 == 1 
            {
                min1.insert(n)
            }
            
            if n % 3 == 2 
            {
                min2.insert(n)
            }
            
            sum += n
        }
        
        if sum % 3 == 1 {
            sum -= min(min1.min, min2.sum)
        } 
        else if sum % 3 == 2 {
            sum -= min(min2.min, min1.sum)
        }
        
        if sum % 3 == 0 {
            return sum
        } else {
            return 0   
        }
    }
    
    struct Bucket 
    {
        var a: Int?
        var b: Int?
        var min: Int {
            return a ?? Int.max
        }
        var sum: Int {
            if a != nil && b != nil {
                return a! + b!
            }
            return Int.max
        }

        mutating func insert(_ n: Int) 
        {
            if a == nil && b == nil {
                a = n
                return
            }
            if a != nil && b == nil {
                if n < a! {
                    b = a
                    a = n
                } else {
                    b = n
                }
                return
            }
            if n < a! && n < b! {
                b = a
                a = n
                return 
            }
            if n < b! {
                b = n
                return
            }
        }
    }
}