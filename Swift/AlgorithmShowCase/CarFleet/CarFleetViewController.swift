//
//  CarFleetViewController.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 16/06/22.
//

import Foundation
class CarFleetViewController: SwiftUIViewController<CarFleetView> {
	let viewModel = CarFleetViewModel()
	let coordinator: Coordinator
	init(coordinator: Coordinator) {
		self.coordinator = coordinator
		super.init(rootView: CarFleetView(vm: viewModel, coordinator: coordinator))
		
	}
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
