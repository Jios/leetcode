// 1152. Analyze User Website Visit Pattern
// https://leetcode.com/problems/analyze-user-website-visit-pattern/


class Solution 
{
    struct Node
    {
        var username: String
        var timestamp: Int
        var website: String
        
        init(_ username: String, 
             _ timestamp: Int, 
             _ website: String)
        {
            self.username = username
            self.timestamp = timestamp
            self.website = website
        }
    }
    
    
    func mostVisitedPattern(_ username: [String], 
                            _ timestamp: [Int],
                            _ website: [String]) -> [String] 
    {
        var nodes: [Node] = []
        var userPathDict: [String: [String]] = [:]
        
        // build nodes
        for i in username.indices
        {
            let node = Node(username[i], timestamp[i], website[i])
            nodes.append(node)
        }
        
        // sort nodes by timestamp
        nodes.sort { (node1, node2) -> Bool in
            return node1.timestamp < node2.timestamp
        }
        
        // build username: website path
        for node in nodes
        {
            let username = node.username
            let path = node.website
            
            // sorted paths/websites by timestamp
            userPathDict[username, default: []].append(path)
        }
        
        // find all possible 3-sequence website paths and their frequences
        var pathFreqDict = [[String]: Int]()
        var maxCounter = 0
        for (user, paths) in userPathDict
        {
            var pathSet: Set<[String]> = []
            
            getSequence(paths, 0, [], &pathSet)
            
            guard pathSet.count > 0 else { continue }
            
            let pathArray = Array(pathSet)
            for path in pathArray
            {
                pathFreqDict[path, default: 0] += 1
                maxCounter = max(maxCounter, pathFreqDict[path]!)
            }
        }
        
        // find website paths with frequency = maxCounter
        var arr: [[String]] = []
        for (paths, freq) in pathFreqDict
        {
            if freq == maxCounter
            {
                arr.append(paths)
            }
        }
        
        // sort results lexicographically
        arr.sort { (arr1, arr2) -> Bool in
            for i in 0 ..< 3
            {
                guard arr1[i] != arr2[i] else { continue }
                
                return arr1[i] < arr2[i]
            }

            return true
        }
        
        return arr[0]
    }
    
    private
    func getSequence(_ arr: [String], 
                     _ index: Int, 
                     _ curr: [String], 
                     _ result: inout Set<[String]>)
    {
        if curr.count == 3 
        {
            result.insert(curr)
            return
        }
        
        guard index < arr.count else { return }
        
        for i in index ..< arr.count 
        {
            getSequence(arr, i + 1, curr + [arr[i]], &result)
        }
    }
}