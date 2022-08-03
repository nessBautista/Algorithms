//
//  TwitterViewViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 21/06/22.
//

import Foundation
import Combine
class TwitterViewModel: ObservableObject {
	let twitter: Twitter = Twitter()
	
}

struct Tweet: Comparable, Equatable {
	
	var userId: Int
	var tweetId: Int
	var time: Int
	
	static func ==(lhs: Tweet, rhs: Tweet) -> Bool{
		lhs.time == rhs.time
	}
	
	static func >(lhs: Tweet, rhs: Tweet) -> Bool{
		lhs.time > rhs.time
	}
	
	static func <(lhs: Tweet, rhs: Tweet) -> Bool {
		lhs.time < rhs.time
	}
	
}
class Twitter {
	var tweetsRegister:[Int: [Tweet]] = [:]     //authorId: Tweet
	var followersRegister:[Int: Set<Int>] = [:] //followerId:Set<FolloweesId>
	var heap:Heap = Heap<Tweet>(elements: [], priorityFunction: >)
	var counter = 0
	init() {
		
	}
	
	func postTweet(_ userId: Int, _ tweetId: Int) {
		let newTweet = Tweet(userId: userId,
							 tweetId: tweetId,
							 time: counter)
		counter += 1
		if self.tweetsRegister[userId] == nil {
			self.tweetsRegister[userId] = [newTweet]
		} else {
			self.tweetsRegister[userId]?.append(newTweet)
		}
	}
	
	
	
	func getNewsFeed(_ userId: Int) -> [Int] {
		// get tweets
		var ids = [userId]
		var tweetsIds: [Int] = []
		if let followees = self.followersRegister[userId] {
			ids += Array(followees)
		}
		// add them to heap
		for id in ids {
			if let tweets = self.tweetsRegister[id] {
				tweets.forEach({heap.enqueue($0)})
			}
		}
		// extract the 10 most recent tweets
		for _ in 0..<10 {
			if let recentTweet = heap.dequeue() {
				tweetsIds.append(recentTweet.tweetId)
			}
		}
		
		// clean the heap
		while !heap.isEmpty {
			_ = heap.dequeue()
		}
		return tweetsIds
	}
	
	func follow(_ followerId: Int, _ followeeId: Int) {
		if self.followersRegister[followerId] == nil {
			let newSet:Set = [followeeId]
			self.followersRegister[followerId] = newSet
		} else {
			self.followersRegister[followerId]?.insert(followeeId)
		}
	}
	
	func unfollow(_ followerId: Int, _ followeeId: Int) {
		self.followersRegister[followerId]?.remove(followeeId)
	}
}

