//
//  FibonacciView.swift
//  Fibonacci
//
//  Created by Nestor Hernandez on 26/04/22.
//

import SwiftUI

struct FibonacciView: View {
	@StateObject var viewModel:ViewModel
    var body: some View {
		VStack{
			Text("Hello This is the Fibonacci Table")
				.font(.title)
			List {
				ForEach(self.$viewModel.feedItems, id: \.idx) { feedItem in
					FeedItemView(feedItem: feedItem)
						.onAppear {
							if feedItem.idx.wrappedValue == (self.viewModel.feedItems.count - 1) {
								self.viewModel.loadFeedItems(feedItem.idx.wrappedValue + 1)
							}
						}
				}
			}.onAppear {
				if self.viewModel.feedItems.count == 0 {
					self.viewModel.loadFeedItems(0)
				}
			}
		}
    }
}

struct FeedItemView: View {
	@Binding var feedItem: FeedItem
	var body: some View {
		HStack{
			Text("\(feedItem.idx)")
			Text("FiboValue: \(feedItem.fiboValue)")
		}
	}
}

struct FibonacciView_Previews: PreviewProvider {
    static var previews: some View {
		FibonacciView(viewModel: ViewModel())
    }
}
