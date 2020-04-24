// 811. Subdomain Visit Count
// https://leetcode.com/problems/subdomain-visit-count/


class Solution
{
    func subdomainVisits(_ cpdomains: [String]) -> [String] 
    {
        var hash: [String: Int] = [:]
        
        for cpdomain in cpdomains
        {
            let arr = cpdomain.components(separatedBy: " ")
            let count = Int(arr[0])!
            
            let domains = arr[1].components(separatedBy: ".")
            
            var i = domains.count - 1
            while i >= 0 
            {
                var name = ""
                for j in i ..< domains.count
                {
                    name += (name.isEmpty ? "" : ".") + domains[j]
                }
                
                hash[name] = (hash[name] ?? 0) + count
                
                i -= 1
            }
        }
        
        return hash.map { "\($0.value) \($0.key)" }
    }
}