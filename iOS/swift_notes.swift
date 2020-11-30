/* 
 * String
 */

// ascii to Character or String
let c = Character(UnicodeScalar(65))
let s = String(UnicodeScalar(UInt8(65)))

let asciiValue: UInt8? = c.asciiValue

// String index
let s = "Swift"
let i = s.index(s.startIndex, offsetBy: 4)
print(s[i])  // "t"

// substring
let str = "Swift"
let substring = str[str.startIndex ..< str.endIndex]
print(substring)  // "Swift"
