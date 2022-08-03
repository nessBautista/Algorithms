//
//  MergeSortedArrayVC.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 21/06/22.
//

import Foundation
import UIKit
import SwiftUI

class MergeSortedArrayViewController: SwiftUIViewController<MergeSortedArrayView>{
	let viewModel = MergeSortedArrayViewModel()
	let coordinator: Coordinator
	init(coordinator: Coordinator){
		self.coordinator = coordinator
		super.init(rootView: MergeSortedArrayView(coordinator: coordinator,
												  viewModel: viewModel))
	}
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
