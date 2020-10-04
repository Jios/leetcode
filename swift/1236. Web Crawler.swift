// 1236. Web Crawler
// https://leetcode.com/problems/web-crawler/


/**
 * // This is the HtmlParser's API interface.
 * // You should not implement it, or speculate about its implementation
 * public class HtmlParser {
 *     public func getUrls(_ url: String) -> [String] {}
 * }
 */

class Solution 
{ 
    func crawl(_ startUrl: String, _ htmlParser: HtmlParser) -> [String] 
    {
        let hostName = getHostName(startUrl)
        
        var visited: Set<String> = [startUrl]
        var queue: [String] = htmlParser.getUrls(startUrl)
        
        
        while !queue.isEmpty
        {
            let url = queue.removeFirst()
            
            if visited.contains(url) || hostName != getHostName(url)
            {
                continue
            }
            
            let urls = htmlParser.getUrls(url)
            
            urls.forEach { url in

                queue.append(url)
            }
            
            visited.insert(url)
        }
        
        return Array(visited)
    }
    
    private
    func getHostName(_ url: String) -> String
    {
        return url.components(separatedBy: "/")[2]
    }
}