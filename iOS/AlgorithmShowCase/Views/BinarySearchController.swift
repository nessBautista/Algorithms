//
//  BinarySearchController.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 20/11/21.
//

import UIKit
import Combine

class BinarySearchController: UIViewController {
    let viewModel = BinarySearchViewModel()
    var target = 1600
    var items:[Int] = (0...2000).map({$0})
    enum Section {
        case main
    }
    
    // Collection
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collection: UICollectionView! = nil
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollection()
        self.loadData()
        
        self.viewModel.search(array: &self.items, target: self.target) { idx in
            guard let index = idx else {return }
            self.collection
                .scrollToItem(at: IndexPath(row: index,
                                            section: 0),
                              at: .centeredVertically, animated: true)
        }
        
    }
    
    func reloadItemAtIndex(_ idx:Int) {
        //This is one way of reloading items, the other is create a new snapshot
        var snapshot = dataSource.snapshot()
        let item = snapshot.itemIdentifiers[idx]
        //item.value = Int.random(in: 1...25)
        snapshot.deleteItems([item])
        snapshot.insertItems([item], beforeItem: snapshot.itemIdentifiers[idx])
        snapshot.reloadItems([item])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func loadData(){
        var snapShot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapShot.appendSections([.main])
        snapShot.appendItems((0...2000).map({$0}))
        dataSource.apply(snapShot)
    }
    private func configureCollection() {
        self.collection = UICollectionView(frame: view.bounds, collectionViewLayout: self.getGridLayout())
        self.collection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(self.collection)
        
        //cell registration
        let cellRegistration = UICollectionView.CellRegistration<LabelCell, Int> { cell, indexPath, item in
            cell.label.text = "\(item)"
            cell.contentView.backgroundColor = self.target == indexPath.row ? .orange : .white
        }
        //DataSource initializer
        self.dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: self.collection,
                                                                           cellProvider: { collection, IndexPath, item in
                                                                            return collection.dequeueConfiguredReusableCell(using: cellRegistration,
                                                                                                                            for: IndexPath,
                                                                                                                            item: item)
                                                                           })
        
    }
    
    private func getGridLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }

}
