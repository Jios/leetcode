// 468. Validate IP Address
// https://leetcode.com/problems/validate-ip-address/


class Solution 
{
    func validIPAddress(_ IP: String) -> String 
    {
        if IP.contains(".") 
        {
            return validateIPv4(IP)
        }
        else if IP.contains(":") 
        {
            return validateIPv6(IP)
        }
        else
        {
            return "Neither"
        }
    }
    
    private func validateIPv4(_ IP: String) -> String
    {
        let arrGroups = IP.components(separatedBy: ".")
        
        let digits = "0123456789"
        
        if arrGroups.count != 4 
        {
            return "Neither"
        }
        
        for group in arrGroups
        {
            guard let val = Int(group) else {
                return "Neither"
            }
            
            let chars = group.filter { !digits.contains($0) }
            if !chars.isEmpty
            {
                return "Neither"
            }
            
            if (group.hasPrefix("0") && group.count > 1) || val < 0 || val > 255
            {
                return "Neither"
            }
        }
        
        return "IPv4"
    }
    
    private func validateIPv6(_ IP: String) -> String
    {        
        let arrGroups = IP.components(separatedBy: ":")
        
        if arrGroups.count <= 1 || arrGroups.count > 8
        {
            return "Neither"
        }
        
        let hexdigits = "0123456789abcdefABCDEF"
        
        for group in arrGroups
        {
            if group.isEmpty || group.count > 4
            {
                return "Neither"
            }
            
            let chars = group.filter { !hexdigits.contains($0) }
            if !chars.isEmpty
            {
                return "Neither"
            }
        }
        
        return "IPv6"
    }
}