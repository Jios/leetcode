// 729. My Calendar I
// https://leetcode.com/problems/my-calendar-i/submissions/


class MyCalendar {
    var calendar: [[Int]] = []
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Bool 
    {
        guard !calendar.isEmpty else {
            calendar.append([start, end])
            return true
        }
        
        if let time = calendar.first, end <= time[0]
        {
            calendar.insert([start, end], at: 0)
            return true
        }
        else if let time = calendar.last, time[1] <= start
        {
            calendar.append([start, end])
            return true
        }
        else
        {
            for i in 0 ..< calendar.count - 1
            {
                let curr = calendar[i]
                let next = calendar[i + 1]
                
                if ((curr[0] - start) * (curr[1] - end)) < 0
                {
                    return false
                }
                else if curr[1] <= start && end <= next[0]
                {
                    calendar.insert([start, end], at: i + 1)
                    return true
                }
            }
        }
        
        return false
    }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(start, end)
 */