//
//  MinStackView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 17/06/22.
//

import SwiftUI

struct MinStackView: View {
	@StateObject var vm: MinStackViewModel = MinStackViewModel()
	var coordinator: Coordinator?
    var body: some View {
		NavigationView{
			VStack {
				HStack {
					Button("Push Random Item"){
						self.vm.pushRandom()
					}
					Text("Current Min Value:\(self.vm.min)")
					Button("PopLast"){
						self.vm.popLast()
					}
				}
				ScrollView {
					LazyVGrid(columns: self.getColumns()) {
						ForEach(self.vm.stack.reversed(), id:\.self) { item in
							ZStack {
								RoundedRectangle(cornerRadius: 10)
									.fill(Color.blue)
									.frame(height: 75)
								Text("min:\(item.min)| val:\(item.value)")
							}
							
						}
					}
				}
			}
			.navigationTitle("Stack With Minimum")
			.toolbar {
				ToolbarItem(placement: .navigation) {
					Button("Go Back") {
						self.coordinator?.goBackHome()
					}
				}
			}
		}
    }
	func getColumns()->[GridItem]{
		[GridItem(.flexible(minimum: 10), spacing: 10)]
	}
}

struct MinStackView_Previews: PreviewProvider {
    static var previews: some View {
		MinStackView(vm: MinStackViewModel())
    }
}
