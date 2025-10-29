//
//  HomeView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 20/11/21.
//

import UIKit
import Combine

class HomeView: UITableViewController {
    let homeViewModel = HomeViewModel()
    var subscriptions = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
		self.homeViewModel.$items
            .sink { items in
                self.tableView.reloadData()
            }.store(in: &subscriptions)
		self.homeViewModel.$navigationState
			.sink { state in
				if state == nil {
					self.presentedViewController?.dismiss(animated: true, completion: nil)
				}
			}.store(in: &subscriptions)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView,
							numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.homeViewModel.items[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
		cell.textLabel?.text = "\(self.homeViewModel.items[indexPath.section][indexPath.row].title)"

        return cell
    }
    
	override func numberOfSections(in tableView: UITableView) -> Int {
		return AlgorithmType.allCases.count
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return "General"
		case 1:
			return "Backtracking"
		case 2:
			return "Stacks"
		case 3:
			return "Array Algorithms"
		case 4:
			return "Heaps"
		default:
			return String()
		}
	}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let item = self.homeViewModel.items[indexPath.section][indexPath.row]
		var vc: UIViewController?
		switch item.screen {
		case .general(algorithm: let generalAlgorithms):
			switch generalAlgorithms {
			case .binarySearch:
				vc = BinarySearchController()
			case .wordSearch:
				vc = SearchBarController()
			case .phone1:
				vc = PhoneViewController()
			case .fibonacci:
				vc = FibonacciViewController()
			}
		case .backtracking(algorithm: let backtracking):
			switch backtracking {
			case .pathMarker:
				vc = PathMarkerViewController()
			case .nqueens:
				vc = NQueensViewController(coordinator: self.homeViewModel)
			}
		case .stacks(let stack):
			switch stack {
			case .minStack:
				vc = MinStackViewController(coordinator: self.homeViewModel)
			case .carFleet:
				vc = CarFleetViewController(coordinator: self.homeViewModel)
			}
		case .arrays(algorithm: let arrayAlgorithm):
			switch arrayAlgorithm {
			case .mergeSort:
				vc = MergeSortedArrayViewController(coordinator: self.homeViewModel)
			}
		case .heaps(algorithm: let heapAlgorithm):
			switch heapAlgorithm {
			case .twitter:
				vc = TwitterViewController(coordinator: self.homeViewModel)
			}
		}
		

		if let viewController = vc {
			viewController.modalPresentationStyle = .fullScreen
			self.present(viewController, animated: true, completion: nil)
		}
        
    }

}
