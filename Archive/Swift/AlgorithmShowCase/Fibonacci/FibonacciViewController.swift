//
//  FibonacciViewController.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 09/06/22.
//

import Foundation
import SwiftUI

class FibonacciViewController: SwiftUIViewController<FibonacciView> {
	let viewModel: FibonacciViewModel = FibonacciViewModel()
	init(){
		super.init(rootView: FibonacciView(viewModel: viewModel))
	}
	
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
