//
//  TwitterRepository.swift
//  TwitterDemo
//
//  Created by Nestor Hernandez on 22/06/22.
//

import Foundation
import Combine
protocol TwitterRepository {
	func getFeed() -> AnyPublisher<[Tweet], TwitterError>
	func postTweet(_ tweet: String)
}

class DemoTwitterRepository: TwitterRepository {
	let dataProvider: TwitterDataProvider
	init(dataProvider: TwitterDataProvider){
		self.dataProvider = dataProvider
	}
	func getFeed() -> AnyPublisher<[Tweet], TwitterError>{
		dataProvider.getFeed()
	}
	func postTweet(_ tweet: String){
		dataProvider.write(tweet)
	}
}

protocol TwitterDataProvider{
	func getFeed() -> AnyPublisher<[Tweet], TwitterError>
	func write(_ tweet: String)
	
}
// Network
// Local DB
// Cloud
// GraphQL
// Demo
class DemoTwitterDataProvider: TwitterDataProvider {
	let twitter = Twitter()
	
	func getFeed() -> AnyPublisher<[Tweet], TwitterError>{
		Future<[Tweet], TwitterError>{ promise in
			promise(.success([]))
		}
		.eraseToAnyPublisher()
	}
	func write(_ tweet: String) {
		self.twitter.postTweet(1,Twitter.buildNewTweetId(),tweet)
	}
}

class Twitter {
	var heap = Heap<Tweet>([], >)
	var tweetRegister:[Int: [Tweet]] = [:]
	var followerRegister:[Int: Set<Int>] = [:]
	var timer: Int = 0
	static var tweetCounter = 100
	static func buildNewTweetId()-> Int {
		let id = tweetCounter
		tweetCounter += 1
		return id
	}
	
	func postTweet(_ userId: Int, _ tweetId: Int, _ tweet: String){
		let newTweet = Tweet(userId: userId,
							 tweetId: tweetId,
							 time: timer,
							 tweet: tweet)
		timer += 1
		if tweetRegister[userId] == nil {
			tweetRegister[userId] = [newTweet]
		} else {
			tweetRegister[userId]?.append(newTweet)
		}
	}
	
	func getNewsFeed(_ userId: Int) -> [Int] {
		var ids:[Int] = [userId]
		var tweetIds: [Int] = []
		
		if let followers = self.followerRegister[userId] {
			ids += Array(followers)
		}
		
		
		for id in ids {
			self.tweetRegister[id]?.forEach({heap.enqueue($0)})
		}
		
		for _ in 0..<10 {
			if let tweetId = heap.dequeue() {
				tweetIds.append(tweetId.tweetId)
			}
		}
		
		while !heap.isEmpty {
			_ = heap.dequeue()
		}
		
		return tweetIds
	}
	func follow(_ followerId: Int, _ followeeId: Int) {
		if followerRegister[followerId] == nil {
			let set: Set<Int> = [followeeId]
			followerRegister[followerId] = set
		} else {
			followerRegister[followerId]?.insert(followeeId)
		}
	}
	
	func unfollow(_ followerId: Int, _ followeeId: Int) {
		followerRegister[followerId]?.remove(followeeId)
	}
}
