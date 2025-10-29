//
//  MainView.swift
//  TwitterDemo
//
//  Created by Nestor Hernandez on 22/06/22.
//

import SwiftUI

struct MainView: View {
	@ObservedObject var viewModel: MainViewModel
    var body: some View {
		VStack {
			ScrollView {
				LazyVGrid(columns: [GridItem(.flexible(minimum: 10))],
						  spacing: 10) {
					ForEach(self.viewModel.data){ item in
						FeedItemView(title: "\(item.value)")
							.onAppear {
								self.viewModel.loadData(item)
							}
					}
				}
			}
		}
    }
}
struct FeedItemView: View {
	var title:String
	var body: some View {
		ZStack(alignment: .leading) {
			RoundedRectangle(cornerRadius: 10)
				.fill(Color.orange)
			Text(title)
				.padding()
		}
		.frame(height: 100)
	}
	
}


//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//		MainView(viewModel: MainViewModel())
//    }
//}
