//
//  HomeViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 20/11/21.
//

import Foundation
import Combine

public enum ScreenType: String, CaseIterable {
	case binarySearch = "BinarySearch"
	case wordSearch = "word search"
	case phone1 = "Phone Number Letter Combinations"
	case fibonacci = "fibonacci's series"
}
struct HomeItem {
	let title: String
	let screen: ScreenType
}
class HomeViewModel: ObservableObject {
    @Published var items:[HomeItem]
    
    init() {
		self.items = ScreenType.allCases.map({HomeItem(title: $0.rawValue, screen: $0)})
    }
    
    
}
