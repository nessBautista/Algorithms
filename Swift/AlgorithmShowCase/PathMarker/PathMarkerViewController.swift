//
//  PathMarkerViewController.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 14/06/22.
//

import Foundation
class PathMarkerViewController: SwiftUIViewController<PathMarkerView> {
	init(){
		super.init(rootView: PathMarkerView())
	}
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
