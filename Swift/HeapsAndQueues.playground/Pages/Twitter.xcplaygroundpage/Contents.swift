//: [Previous](@previous)

import Foundation
struct Tweet: Equatable, Comparable {
	var userId: Int
	var tweetId:Int
	var time:Int
	
	static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.tweetId == rhs.tweetId
	}
	
	static func < (lhs: Self, rhs: Self) -> Bool {
		lhs.time < rhs.time
	}
	static func > (lhs: Self, rhs: Self) -> Bool {
		lhs.time > rhs.time
	}
	
}
class Twitter {
	
	var time = 0
	var followersMap:[Int: Set<Int>] = [:]
	var tweetsMap:[Int: [Tweet]] = [:]
	var maxHeap: Heap<Tweet>
	
	init() {
		self.maxHeap = Heap(elements: [Tweet](), priorityFunction: >)
	}
	
	func postTweet(_ userId: Int, _ tweetId: Int) {
		let tweet = Tweet(userId: userId, tweetId: tweetId, time: self.time)
		self.time += 1
		
		if tweetsMap[userId] == nil {
			tweetsMap[userId] = []
		}
		tweetsMap[userId]?.append(tweet)
	}

	func getNewsFeed(_ userId: Int) -> [Int] {
		var output:[Int] = []
		
		self.follow(userId, userId)
		guard let followees = self.followersMap[userId] else {return output}
		for followee in followees {
			if let tweets = self.tweetsMap[followee] {
				tweets.forEach({self.maxHeap.enqueue($0)})
			}
		}
		
		while output.count < 10 {
			if let tweetId = self.maxHeap.dequeue()?.tweetId {
				output.append(tweetId)
			} else {
				break
			}
		}
		
		while !self.maxHeap.isEmpty {
					self.maxHeap.dequeue()
		}
		
		return output
	}

	func follow(_ followerId: Int, _ followeeId: Int) {
		if followersMap[followerId] == nil {
			followersMap[followerId] = Set<Int>()
		}
		followersMap[followerId]?.insert(followeeId)
		
	}

	func unfollow(_ followerId: Int, _ followeeId: Int) {
		if followersMap[followerId]?.contains(followeeId) ?? false {
			followersMap[followerId]?.remove(followeeId)
		}
	}
}

let twitter = Twitter()
twitter.postTweet(1,5)
print(twitter.getNewsFeed(1))
twitter.follow(1,2)
twitter.postTweet(2,6)
print(twitter.getNewsFeed(1))
twitter.unfollow(1,2)
print(twitter.getNewsFeed(1))
 
//: [Next](@next)
