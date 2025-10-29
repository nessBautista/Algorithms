//
//  FibonacciViewController.swift
//  Fibonacci
//
//  Created by Nestor Hernandez on 26/04/22.
//

import Foundation
class FibonacciViewController:SwiftUIViewController<FibonacciView> {
	let viewModel: ViewModel
	init(viewModel: ViewModel){
		self.viewModel = viewModel
		super.init(rootView: FibonacciView(viewModel:viewModel))
	}
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
