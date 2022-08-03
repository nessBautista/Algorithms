//
//  PhoneView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 08/06/22.
//

import SwiftUI
import Foundation
class PhoneViewController: SwiftUIViewController<PhoneView> {
	let viewModel:PhoneViewModel = PhoneViewModel()
	
	init(){
		super.init(rootView: PhoneView(viewModel: viewModel))
	}
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
