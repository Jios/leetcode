// 981. Time Based Key-Value Store
// https://leetcode.com/problems/time-based-key-value-store/


class TimeMap 
{
    var hash: [String: [(Int, String)]]
    
    /** Initialize your data structure here. */
    init() {
        hash = [:]
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) 
    {
        hash[key, default: []].append((timestamp, value))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String
     {
        if let arr = hash[key]
        {
            // return search(arr, timestamp)
            if let recent = arr.last(where: { $0.0 <= timestamp }) 
            {
                return recent.1
            }
        }
        
        return ""
    }
    
    /*
    private
    func search(_ arr: [(Int, String)], _ timestamp: Int) -> String
    {
        var left = 0, right = arr.count - 1
        
        while left <= right
        {
            let mid = left + (right - left) / 2
            let t = arr[mid].0
            
            if t == timestamp
            {
                return arr[mid].1
            }
            else if t > timestamp
            {
                right = mid - 1
            }
            else
            {
                left = mid + 1
            }
        }
        
        return ""
    }
    // */
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */