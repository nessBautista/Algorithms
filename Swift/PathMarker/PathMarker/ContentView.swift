//
//  ContentView.swift
//  PathMarker
//
//  Created by Nestor Hernandez on 10/03/22.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var vm = ViewModel()
    let layout = [
		GridItem(.flexible(),spacing: 1),
		GridItem(.flexible(),spacing: 1),
		GridItem(.flexible(),spacing: 1),
		GridItem(.flexible(),spacing: 1),
		GridItem(.flexible(),spacing: 1),
		GridItem(.flexible(),spacing: 1),
		GridItem(.flexible(),spacing: 1),
		GridItem(.flexible(),spacing: 1),
		GridItem(.flexible(),spacing: 1),
		GridItem(.flexible(),spacing: 1),]
	
	var body: some View {
		ScrollView{
			if self.vm.state == .loaded {
				loadedView
			} else {
				Text("Loading ... ")
			}
			
		}
    }
	
	var loadedView: some View {
		LazyVGrid(columns: layout, spacing:1) {
			ForEach(vm.pathItems.indices) { idx in
				ForEach(vm.pathItems[idx], id: \.self) { item in
					Rectangle()
						.fill(item.value == 0 ? Color.gray : (item.value == 3) ? Color.orange: Color.black)
						.frame(height:50)
						.onTapGesture {
							vm.searchPath(item.coordinates)
						}
				}
			}
		}.onAppear{
			vm.printItems()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
