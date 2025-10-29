//
//  CarFleetView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 16/06/22.
//

import SwiftUI

struct CarFleetView: View {
	@ObservedObject var vm:CarFleetViewModel
	let coordinator: Coordinator
	let width = UIScreen.main.bounds.width
	func getColumns()->[GridItem]{
		Array(repeating: GridItem(.fixed(width / CGFloat(vm.target)), spacing: 1),
			  count: vm.target)
	}
	@State var numberOfFleets: Int = 0
	var body: some View {
		NavigationView {
			VStack {
				Button("Calculate Fleets"){
					self.numberOfFleets = self.vm.calculateCarFleets()
				}
				Text("\(numberOfFleets)")
					.font(.title)
				LazyVGrid(columns: getColumns()) {
					ForEach(0..<vm.cars.count){ idx in
						ForEach(0..<vm.target){ step in
							
							RoundedRectangle(cornerRadius: 10)
								.fill(step >= vm.cars[idx].position
									  ? Color.blue:Color.orange)
								.frame(width:width / CGFloat(vm.target),height: 50)
								
								
						}
					}
				}
			}
			
			.navigationTitle("Car Fleet")
			.navigationBarTitleDisplayMode(.large)
			.toolbar {
				ToolbarItem(placement: .navigation) {
					Button("Go Back"){
						coordinator.goBackHome()
					}
				}
			}
		}
    }
}

//struct CarFleetView_Previews: PreviewProvider {
//    static var previews: some View {
//		CarFleetView(vm: CarFleetViewModel())
//    }
//}
