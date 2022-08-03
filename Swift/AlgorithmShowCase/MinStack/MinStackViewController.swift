//
//  MinStackViewController.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 17/06/22.
//

import Foundation
class MinStackViewController: SwiftUIViewController<MinStackView>{
	let coordinator: Coordinator?
	//let vm: MinStackViewModel = MinStackViewModel()
	
	init(coordinator: Coordinator?){
		self.coordinator = coordinator
		super.init(rootView: MinStackView(coordinator: coordinator))
	}
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
