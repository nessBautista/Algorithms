//
//  PhoneView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 08/06/22.
//

import SwiftUI

struct PhoneView: View {
	@ObservedObject var viewModel: PhoneViewModel
    var body: some View {
		let colums = [GridItem(.adaptive(minimum: 100))]
		LazyVGrid(columns: colums, alignment: .center){
			ForEach(viewModel.data, id: \.self){ item in
				PhoneButton(title: item)
					.onTapGesture {
						self.viewModel.didTapOnNumber(item)
					}
			}
		}
		.padding(.vertical)
		PhoneOutput(viewModel: viewModel)
    }
}
struct PhoneOutput: View {
	@ObservedObject var viewModel: PhoneViewModel
	var body: some View {
		Text(viewModel.dialedNumbers)
			.frame(maxWidth:.infinity)
		HStack {
			Text("Combinations")
			Text(viewModel.permutations)
		}
	}
}
struct PhoneButton: View {
	let title:String
	var body: some View {
		Text(title)
			.frame(width: 150, height: 150, alignment: .center)
			.background(Color.blue)
	}
}

struct PhoneView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneView(viewModel: PhoneViewModel())
    }
}
