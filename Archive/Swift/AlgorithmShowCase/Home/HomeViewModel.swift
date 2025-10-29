//
//  HomeViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 20/11/21.
//

import Foundation
import Combine

public enum AlgorithmType: CaseIterable {
	public static var allCases: [AlgorithmType]{
		return [.general(algorithm: .binarySearch),
				backtracking(algorithm: .pathMarker),
				stacks(algorithm: .carFleet),
				arrays(algorithm: .mergeSort),
				heaps(algorithm: .twitter)]
	}
	case general(algorithm: GeneralAlgorithms)
	case backtracking(algorithm: BacktrackingAlgorithms)
	case stacks(algorithm: StackAlgorithms)
	case arrays(algorithm: ArrayAlgorithms)
	case heaps(algorithm: HeapAlgorithms)
}

public enum GeneralAlgorithms: String, CaseIterable {
	case binarySearch = "BinarySearch"
	case wordSearch = "word search"
	case phone1 = "Phone Number Letter Combinations"
	case fibonacci = "fibonacci's series"
}

public enum BacktrackingAlgorithms: String, CaseIterable {
	case pathMarker = "PathMarker"
	case nqueens = "N Queens"
}

public enum StackAlgorithms: String, CaseIterable {
	case minStack = "Stack with Minimum"
	case carFleet = "Car Fleet"
}
public enum ArrayAlgorithms: String, CaseIterable{
	case mergeSort = "Merge Sorted Algorithm"
}
public enum HeapAlgorithms: String, CaseIterable{
	case twitter = "Design Twitter"
}


struct HomeItem {
	let title: String
	let screen: AlgorithmType
}


class HomeViewModel: ObservableObject {
	@Published var navigationState: AlgorithmType?
    @Published var items:[[HomeItem]]
    
    init() {
		self.items = Array(repeating:[], count: AlgorithmType.allCases.count)
		self.items[0] = GeneralAlgorithms.allCases.map({HomeItem(title: $0.rawValue, screen: .general(algorithm: $0))})
		self.items[1] = BacktrackingAlgorithms.allCases.map({HomeItem(title: $0.rawValue, screen: .backtracking(algorithm: $0))})
		self.items[2] = StackAlgorithms.allCases.map({HomeItem(title: $0.rawValue, screen: .stacks(algorithm: $0))})
		self.items[3] = ArrayAlgorithms.allCases.map({HomeItem(title: $0.rawValue, screen: .arrays(algorithm: $0))})
		self.items[4] = HeapAlgorithms.allCases.map({HomeItem(title: $0.rawValue, screen: .heaps(algorithm: $0))})
		print(items)
    }
    
}

protocol Coordinator {
	func goBackHome()
}

extension  HomeViewModel: Coordinator {
	func goBackHome() {
		self.navigationState = nil
	}
}

