//
//  MainViewController.swift
//  TwitterDemo
//
//  Created by Nestor Hernandez on 22/06/22.
//

import Foundation

class MainViewController: SwiftUIViewController<MainView> {
	let mainViewModel: MainViewModel
	
	init(viewModel: MainViewModel){
		self.mainViewModel  = viewModel
		super.init(rootView: MainView(viewModel: mainViewModel))
	}
}
