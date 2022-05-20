//
//  ViewModel.swift
//  Fibonacci
//
//  Created by Nestor Hernandez on 26/04/22.
//

import Foundation
class ViewModel: ObservableObject{
	@Published var feedItems:[FeedItem] = []
	
	func loadFeedItems(_ idx: Int){
		let feedItem = makeFeedItem(idx: idx ,
									fiboValue: getFibonacci(idx: idx))
		feedItems.append(feedItem)
	}
	
	func getFibonacci(idx: Int)->Int{
		guard idx > 0 else {return 0}
		guard idx > 1 else {return 1}
		let n_1 = self.feedItems[idx-1].fiboValue
		let n_2 = self.feedItems[idx-2].fiboValue
		return n_1 + n_2
	}
	
	func makeFeedItem(idx:Int = 0,
					  fiboValue:Int = 0) -> FeedItem {
		
		FeedItem(idx: idx,
				 fiboValue: fiboValue)
	}
}
struct FeedItem {
	var idx: Int
	var fiboValue: Int
	init(idx: Int, fiboValue:Int){
		self.idx = idx
		self.fiboValue = fiboValue
	}
}
