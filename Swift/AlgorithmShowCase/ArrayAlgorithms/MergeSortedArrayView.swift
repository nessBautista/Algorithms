//
//  MergeSortedArrayView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 21/06/22.
//

import SwiftUI

struct MergeSortedArrayView: View {
	let coordinator: Coordinator
	@ObservedObject var viewModel: MergeSortedArrayViewModel
    var body: some View {
		NavigationView {
			VStack {
				controls
				workspace
			}
				.navigationTitle("Merge Sorted Array")
				.navigationBarTitleDisplayMode(.large)
				.navigationViewStyle(.stack)
				.toolbar {
					ToolbarItem(placement: .navigation) {
						Button("Go Back") {
							coordinator.goBackHome()
						}
					}
				}
				
		}
    }
	
	var controls: some View {
		Button {
			self.viewModel.applyMergeSort()
		} label: {
			Text("Apply Merge Sort")
		}
	}
	
	var workspace: some View {
		ScrollView {
			LazyVGrid(columns: [GridItem(.flexible(maximum: 50)),
							 GridItem(.flexible(maximum: 50)),
							 GridItem(.flexible(maximum: 50)),
							 GridItem(.flexible(maximum: 50)),
							 GridItem(.flexible(maximum: 50)),
							 GridItem(.flexible(maximum: 50)),
							 GridItem(.flexible(maximum: 50))],
					  spacing: 1){
				ForEach(viewModel.data, id:\.self){ item in
					ZStack {
						RoundedRectangle(cornerRadius: 10)
							.fill(Color.blue)
							.frame(height: 50)
						Text("\(item)")
					}
					
				}
			}
		}
	}
}

//struct MergeSortedArrayView_Previews: PreviewProvider {
//    static var previews: some View {
//        MergeSortedArrayView(viewModel: MergeSortedArrayViewModel())
//    }
//}
