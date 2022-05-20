
import SwiftUI

public struct ContentView: View {
    let vm = ViewModel(rows: (0...10).map({$0}),
                       columns: (0...10).map({$0}))
    
    let data = (1...100).map { "Item \($0)" }

    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 10)
    
    public init(){}

    public var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach((0..<10)) { idx in
                        Text("\(idx)")
                    }

                }
                .padding(.horizontal)
            }
            .frame(width:300,height: 500)
        }
}
