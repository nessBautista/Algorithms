//
//  FibonacciView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 09/06/22.
//

import SwiftUI

struct FibonacciView: View {
	@ObservedObject var viewModel: FibonacciViewModel
	
    var body: some View {
		ScrollView {
			LazyVStack {
				ForEach((0..<self.viewModel.data.count), id:\.self){ idx in
					itemView(title: self.viewModel.data[idx])
						.onAppear {
							if idx == self.viewModel.data.count - 1 {
								self.viewModel.nextItem(idx + 1)
							}
						}
				}
			}.onAppear {
				self.viewModel.loadData()
			}
		}
    }
}

struct itemView: View {
	var title: String
	var body: some View {
		Text(title)
	}
}

struct FibonacciView_Previews: PreviewProvider {
    static var previews: some View {
		FibonacciView(viewModel: FibonacciViewModel())
    }
}
