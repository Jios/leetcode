// 1088. Confusing Number II
// https://leetcode.com/problems/confusing-number-ii/

class Solution {
    
    let validRotatedNumbers: Set<Int> = [0,1,6,8,9]
    let numbersToRotated = [0: 0, 1: 1, 6: 9, 8: 8, 9: 6];
    
    func confusingNumberII(_ maxNumberInclusive: Int) -> Int {
        var digits = [Int]()
        var confusingCount: Int = 0
        helper(maxNumberInclusive, &digits, 0, &confusingCount)
        return confusingCount
    }
    
    func helper(_ maxNumberInclusive: Int, _ digits: inout [Int], _ currentNumber: Int, _ confusingCount: inout Int) {
        for digit in validRotatedNumbers {
            let nextNumber = currentNumber * 10 + digit
            if nextNumber == currentNumber || nextNumber > maxNumberInclusive {
                continue
            }
            if currentNumber == 0 && digit == 0 {
                continue
            }
            digits.append(digit)
            if isConfusing(digits) {
                confusingCount += 1
            }
            helper(maxNumberInclusive, &digits, nextNumber, &confusingCount)
            digits.removeLast()
        }
    }
    
    func isConfusing(_ digits: [Int]) -> Bool {
        var i = 0
        while i < digits.count { // (digits.count / 2) is more optimized 
            if digits[digits.count - i - 1] != numbersToRotated[digits[i]]! {
                return true
            }
            i += 1
        }
        return false
    }
}


class Solution2 {
    func confusingNumberII(_ maxNumberInclusive: Int) -> Int {
        var seen = [Int: Bool]()
        var validRotatedNumbers: Set<Int> = [0,1,6,8,9]
        var numbersToRotated = [0: 0, 1: 1, 6: 9, 8: 8, 9: 6];
        var confusingCount = 0
        for number in 1...maxNumberInclusive {
            var currentNumber = number
            var isValid = true
            var isChanged = false
            // 10: 0 isValid = true ischanged = false; 0
            var digits = [Int]() // note: 123 will enter into this as [3, 2, 1] 
            while currentNumber > 0 {
                let remainder = currentNumber % 10
                if !validRotatedNumbers.contains(remainder) {
                    isValid = false
                    break
                }
                digits.append(remainder)
                currentNumber /= 10
            }
            if !isValid {
                continue
            }
            var i = 0
            // 10 -> [0, 1] ... 6 -> [9]. the reversed digits represents the un-mapped rotated number. basically a halfway form. just compare digit at i with mapped 
            var isConfusing = false
            while i < digits.count {
                if digits[digits.count - i - 1] != numbersToRotated[digits[i]]! {
                    isConfusing = true
                    break
                }
                i += 1
            }
            if isConfusing {
                confusingCount += 1
            }
        }
        return confusingCount
    }
}

/*

10 is confusing

6 is confusing, 16/61/91 is also confusing

8 is not confusing, 18/81/81 is confusing

1001 is not confusing

it is not possible to process (least sig to most sig) 1 then 0 and say "currentNumber is 10 which is in map, 10 is confusing, 1001 is confusing. 

66 is confusing
660 is confusing
661 is confusing
662 is invalid
663 is invalid
664 is invalid
665 is invalid
666 is confusing
668 is confusing
669 is confusing

18 is confusing
181 is not confusing first and last are the same, middle part is valid and symmetrical, causing symmetry
182 is invalid
183 is invalid
184 invalid
185 invalid
186 confusing
187 invalid
188 confusing
189 confusing

118 is confusing
811 different. from left we know this by position 1

1181 is confusing ... checking first and last will not be sufficient even though all numbers are symmetrical and first/last same
1811 different. from left we know this by position 2

i think we will still have to check left to right/ right to left. we can build new numbers from existing numbers. this saves digits array creations

we can also avoid going down paths with invalid numbers. this is a big optimization since half the digits are invalid and the number invalid grows exponentially with digits lengths

1 builds 1, 10-19, 100-199
2 builds 2, 20-19, 200-299
3 builds 3, 30-39, 300-399
9 builds 9, 90-99, 900-999

iterating first digit and expanding while less than or equal to n will suffice.



*