//
//  SearchBarView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 18/05/22.
//

import Foundation
import SwiftUI
class SearchBarController: SwiftUIViewController<SearchBarView> {
	let viewModel: SearchBarViewModel = SearchBarViewModel()
	init() {
		super.init(rootView: SearchBarView(viewModel: viewModel))
	}
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
