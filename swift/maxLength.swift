class Solution {
    func maxLength(_ arr: [String]) -> Int {
        guard !arr.isEmpty else { return 0 }
        
        return getMaxUniqueCharacters(arr, "", 0)
    }
    
    func getMaxUniqueCharacters(_ arr: [String], _ currentString: String, _ index: Int) -> Int {
        if index >= arr.count {
            return currentString.count
        }
        
        let concatenatedString = currentString + arr[index]
        var inclusiveCount = currentString.count
        
        if isUnique(concatenatedString) {
            inclusiveCount = getMaxUniqueCharacters(arr, concatenatedString, index + 1)
        }
        
        let exclusiveCount = getMaxUniqueCharacters(arr, currentString, index + 1)
        
        return max(inclusiveCount, exclusiveCount)
    }
    
    func isUnique(_ string: String) -> Bool {
        var set = Set<Character>()
        
        for char in string {
            if set.contains(char) {
                return false
            }
            
            set.insert(char)
        }
        
        return true
    }
}