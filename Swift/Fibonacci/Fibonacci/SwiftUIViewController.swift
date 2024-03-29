//
//  SwiftUIViewController.swift
//  Fibonacci
//
//  Created by Nestor Hernandez on 26/04/22.
//

import SwiftUI

open class SwiftUIViewController<Content:View>:UIHostingController<Content>{
	public override init(rootView: Content) {
		super.init(rootView: rootView)
	}
	
	@MainActor @objc required dynamic public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
