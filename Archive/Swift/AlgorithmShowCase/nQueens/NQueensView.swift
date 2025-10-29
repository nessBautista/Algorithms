//
//  NQueensView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 15/06/22.
//

import SwiftUI

struct NQueensView: View {
	let coordinator: Coordinator
	
	@StateObject var vm: NQueensViewModel = NQueensViewModel(width: 5, height: 5)
    
	var body: some View {
		NavigationView {
			VStack {
				controls
				chessBoard
					.navigationTitle("N-Queens")
					.navigationBarTitleDisplayMode(.large)
					.toolbar {
						ToolbarItem(placement: .navigation) {
							Button("Back") {
								coordinator.goBackHome()
							}
						}
					}
			}
		}
    }
	var controls: some View {
		VStack{
			HStack{
				Button("Place N Queens"){
					self.vm.placeNQueens(5)
				}
				Text("solution:\(vm.it) of: \(vm.chessOutputCount)")
				Button("next"){
					self.vm.next()
				}
			}
			HStack {
				Button("Row"){
					self.vm.displayState = .row
				}
				.background(self.vm.displayState == .row ? Color.green:Color.gray)
				Button("Column"){
					self.vm.displayState = .column
				}
				.background(self.vm.displayState == .column ? Color.green:Color.gray)
				Button("Positive Diagonal"){
					self.vm.displayState = .positiveDiagonal
				}
				.background(self.vm.displayState == .positiveDiagonal ? Color.green:Color.gray)
				Button("Negative Diagonal"){
					self.vm.displayState = .negativeDiagonal
				}
				.background(self.vm.displayState == .negativeDiagonal ? Color.green:Color.gray)
			}
		}
	}
	var chessBoard: some View {
		VStack {
			ForEach(0..<vm.plane.count){ row in
				HStack {
					ForEach(0..<vm.plane[row].count) { col in
						CellItem(title: vm.getTitle(col, row), colorId: vm.plane[row][col])
					}
				}
			}
		}
	}
}

struct CellItem: View {
	let title: String
	let colorId: Int
	var body: some View{
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.fill(colorId == 0 ? Color.blue: Color.orange)
				.frame(width: 50, height: 50)
			Text(title)
		}
	}
	
}
//struct NQueensView_Previews: PreviewProvider {
//    static var previews: some View {
//        NQueensView()
//    }
//}
