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
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView,
							numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.homeViewModel.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
		cell.textLabel?.text = "\(self.homeViewModel.items[indexPath.row].title)"

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let item = self.homeViewModel.items[indexPath.row]
		var vc: UIViewController?
		switch item.screen {
		case .binarySearch:
			vc = BinarySearchController()
		case .wordSearch:
			vc = SearchBarController()
		case .phone1:
			vc = PhoneViewController()
		case .fibonacci:
			vc = FibonacciViewController()
		}
		if let viewController = vc {
			viewController.modalPresentationStyle = .fullScreen
			self.present(viewController, animated: true, completion: nil)
		}
        
    }

}
