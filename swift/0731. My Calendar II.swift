// 731. My Calendar II
// https://leetcode.com/problems/my-calendar-ii/


class MyCalendarTwo 
{
    var calendars: [[Int]] = []
    var overlaps: [[Int]] = []
    
    
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Bool 
    {
        for overlap in overlaps
        {
            if start < overlap[1] && overlap[0] < end
            {
                return false
            }
        }
        
        for calendar in calendars
        {
            if start < calendar[1] && calendar[0] < end
            {
                let overlap = [max(start, calendar[0]), min(end, calendar[1])]
                overlaps.append(overlap)
            }
        }
        
        calendars.append([start, end])
        
        return true
    }
}

/**
 * Your MyCalendarTwo object will be instantiated and called as such:
 * let obj = MyCalendarTwo()
 * let ret_1: Bool = obj.book(start, end)
 */