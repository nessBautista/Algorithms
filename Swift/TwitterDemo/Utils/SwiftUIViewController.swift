//
//  SwiftUIViewController.swift
//  TwitterDemo
//
//  Created by Nestor Hernandez on 22/06/22.
//

import Foundation
import SwiftUI

open class SwiftUIViewController<Content: View>: UIHostingController<Content>{
	override public init(rootView: Content) {
		super.init(rootView: rootView)
	}
	@available(*, unavailable,
				message: "nib files are not supported for this version of the SwiftUIViewController"
	)
	public required init?(coder aDecoder: NSCoder) {
		fatalError("nib files are not supported for this version of the SwiftUIViewController")
	}
}
