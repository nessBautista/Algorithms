//
//  HomeViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 20/11/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var items:[String]
    
    init() {
        self.items = ["Binary Search", "QuickSort"]
    }
    
    
}
