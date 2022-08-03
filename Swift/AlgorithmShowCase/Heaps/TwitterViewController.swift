//
//  TwitterViewController.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 21/06/22.
//

import Foundation
class TwitterViewController: SwiftUIViewController<TwitterView> {
	let coordinator: Coordinator
	let viewModel: TwitterViewModel = TwitterViewModel()
	
	init(coordinator: Coordinator) {
		self.coordinator = coordinator
		super.init(rootView: TwitterView(coordinator: coordinator,
										 viewModel: viewModel))
	}
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
