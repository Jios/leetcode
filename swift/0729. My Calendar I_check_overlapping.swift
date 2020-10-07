// 729. My Calendar I
// https://leetcode.com/problems/my-calendar-i/submissions/


class MyCalendar 
{
    var calendars: [[Int]] = []
    
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Bool
    {
        for cal in calendars
        {
            if start < cal[1] && cal[0] < end
            {
                return false
            }
        }
        
        calendars.append([start, end])
        return true
    }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(start, end)
 */