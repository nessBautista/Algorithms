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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.homeViewModel.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(self.homeViewModel.items[indexPath.row])"

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = BinarySearchController()
        self.present(vc, animated: true, completion: nil)
    }

}
