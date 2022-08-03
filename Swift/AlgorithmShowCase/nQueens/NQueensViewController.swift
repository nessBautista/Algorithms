//
//  NQueensViewController.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 15/06/22.
//

import Foundation
class NQueensViewController: SwiftUIViewController<NQueensView>{
	let coordinator: Coordinator
	init(coordinator: Coordinator){
		self.coordinator = coordinator
		super.init(rootView: NQueensView(coordinator: coordinator))
	}
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
