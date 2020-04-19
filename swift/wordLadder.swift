class Solution {
	
	// Global vairable of dictionary
	// Key: generic word
	// Value: words that share same generic word
	var dict: [String: [String]] = [:]
	
	func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
		
		guard wordList.contains(endWord) else { return 0 }
		
		// Construct the dictionary
		for word in wordList {
			for(_, i) in word.indices.enumerated() {
				let generic = String(word[..<i]) + "*" + String(word[word.index(after: i)...])
				dict[generic, default: []].append(word)
			}
		}
		
		// Queue for bfs, q1 from bein, q2 from end
		var q1: [(word: String, level: Int)] = []
		var q2: [(word: String, level: Int)] = []
		
		q1.append((beginWord, 1))
		q2.append((endWord, 1))
		
		// Visit history for from being and end
		var visited1: [String: Int] = [:]
		var visited2: [String: Int] = [:]
		
		while !q1.isEmpty, !q2.isEmpty {
			
			// One hop from begin word, forward
			var answer = bfs(&q1, &visited1, &visited2)
			if answer > 0 { return answer }
			
			// One hop from end word, backword
			answer = bfs(&q2, &visited2, &visited1)
			if answer > 0 { return answer }
		}
		return 0
	}
	
	private func bfs(_ queue: inout [(word: String, level: Int)],
									 _ visited: inout [String: Int],
									 _ otherVisited: inout [String: Int]) -> Int {
		
		let (currWord, level) = queue.removeFirst()
		for (_, i) in currWord.indices.enumerated() {
			let generic = String(currWord[..<i] + "*" + currWord[currWord.index(after: i)...])
			
			guard let nexts = self.dict[generic] else { continue }
			
			for next in nexts {
				// If at any point, we find what we are looking for from
				// the visit history of the other direction,
				// we find our answer then return
				if let otherLevel = otherVisited[next] {
					return level + otherLevel
				}
				
				// If we have yet visited the next word,
				// we save the word and the level value into the dictionary
				if visited[next] == nil {
					visited[next] = level + 1
					queue.append((next, level + 1))
				}
			}
		}
		return 0
	}
}