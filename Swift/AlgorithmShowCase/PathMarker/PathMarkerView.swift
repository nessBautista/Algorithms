//
//  PathMarkerView.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 14/06/22.
//

import SwiftUI

struct PathMarkerView: View {
	@StateObject var vm: PathMarkerViewModel = PathMarkerViewModel(5, 20)
    var body: some View {
		ScrollView {
			ForEach(0..<vm.rows, id: \.self){ row in
				LazyVGrid(columns: self.getColumns()) {
					ForEach(0..<vm.columns, id: \.self){ col in
						RoundedRectangle(cornerRadius: 10)
							.fill(vm.dataSource[row][col] == 0 ? Color.black
										   : vm.dataSource[row][col] == 1 ? Color.green
										   : Color.blue)
							.frame(height: 75)
							.onTapGesture {
								vm.findPath(col, y: row)
							}
					}
				}
				
			}
		}
    }
		
	func getColumns()->[GridItem]{
		let columns = (0..<self.vm.columns).map({_ in GridItem(.fixed(75),
															   spacing: 10,
															   alignment: .center)})
		
		return columns
	}
	
}

struct PathMarkerView_Previews: PreviewProvider {
    static var previews: some View {
        PathMarkerView()
    }
}
