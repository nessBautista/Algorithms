//
//  TwitterView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 21/06/22.
//

import SwiftUI

struct TwitterView: View {
	var coordinator: Coordinator?
	@ObservedObject var viewModel: TwitterViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
		TwitterView(viewModel:TwitterViewModel())
    }
}
