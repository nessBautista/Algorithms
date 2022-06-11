//
//  SearchBarView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 18/05/22.
//

import SwiftUI

struct SearchBarView: View {
	@ObservedObject var viewModel: SearchBarViewModel
	
    var body: some View {
		NavigationView {
			Text("Search View")
				.background(Color.blue)
				.frame(maxWidth: .infinity,
						maxHeight: .infinity)
		}
		.searchable(text: $viewModel.query) {
			VStack {
				ForEach(viewModel.autoCompletions, id:\.self) { word in
					Text(word)
						.searchCompletion(word)
				}
				
					
			}
			
		}
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
		SearchBarView(viewModel: SearchBarViewModel())
    }
}
