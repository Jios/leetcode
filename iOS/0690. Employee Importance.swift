// 690. Employee Importance
// https://leetcode.com/problems/employee-importance/


/**
 * Definition for Employee.
 * public class Employee {
 *     public var id: Int
 *     public var importance: Int
 *     public var subordinates: [Int]
 *     public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
 *         self.id = id
 *         self.importance = importance
 *         self.subordinates = subordinates
 *     }
 * }
 */

class Solution 
{
    var hash: [Int: Employee] = [:]
    
    func getImportance(_ employees: [Employee], _ id: Int) -> Int 
    {
        for employee in employees
        {
            hash[employee.id] = employee
        }
        
        return dfs(id)
    }
    
    private
    func dfs(_ id: Int) -> Int
    {
        guard let employee = hash[id] else {
            return 0
        }
        
        var total = employee.importance
        
        for subordinate in employee.subordinates
        {
            total += dfs(subordinate)
        }
        
        
        return total
    }
}