//
//  DependencyContainer.swift
//  TwitterDemo
//
//  Created by Nestor Hernandez on 22/06/22.
//

import Foundation
class DependencyContainer {
	//Shared dependencies
	let mainViewModel:MainViewModel
	init(){
		func makeTwitterRepo() -> TwitterRepository {
			let dataProvider = makeDataProvider()
			return DemoTwitterRepository(dataProvider: dataProvider)
		}
		func makeDataProvider()->TwitterDataProvider{
			DemoTwitterDataProvider()
		}
		let repo = makeTwitterRepo()
		self.mainViewModel = MainViewModel(repository: repo)
	}
	
	func makeMainViewController()->MainViewController {
		return MainViewController(viewModel: self.mainViewModel)
	}
}
