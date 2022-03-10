//
//  BinarySearchViewModel.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 20/11/21.
//

import Foundation
class BinarySearchViewModel {
    @Published var items:[Int]
    
    init(){
        self.items = []
    }
    
    func search(array: inout [Int],
                target: Int,
                onCompletion: @escaping (Int?) ->()) {
        onCompletion(binarySearch(array: &array, target: target))
    }
    
    func binarySearch(array: inout [Int], target: Int) -> Int? {
        var low = 0
        var high = array.count - 1
        while low <= high {
            let mid: Int  = Int(Float((low + high) / 2).rounded(.down))
            let guess = array[mid]
            if guess == target {
                return mid
            } else if guess < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return nil
    }
    
    
}
