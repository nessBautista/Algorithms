//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Nestor Hernandez on 23/06/22.
//

import Foundation
struct Tweet: Comparable {
	var userId: Int
	var tweetId: Int
	var time: Int
	var tweet: String
	
	static func ==(lhs: Tweet, rhs: Tweet)->Bool {
		lhs.time == rhs.time
	}
	static func >(lhs: Tweet, rhs: Tweet)->Bool {
		lhs.time > rhs.time
	}
	static func <(lhs: Tweet, rhs: Tweet)->Bool {
		lhs.time < rhs.time
	}
}

