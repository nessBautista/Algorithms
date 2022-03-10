import Foundation

public class ViewModel:ObservableObject {
    var data:[[Model]]
    init(rows:[Int], columns:[Int]) {
        self.data = []
        for row in rows {
            var r:[Model] = []
            for col in columns {
                let model = Model(x: row, y: col)
                r.append(model)
            }
            self.data.append(r)
        }
    }
}

public struct Model: Equatable, Identifiable, Hashable {
    public var id: ObjectIdentifier
    
    public static func == (lhs: Model, rhs: Model) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    let x:Int
    let y: Int
    init(x:Int, y:Int) {
        self.x = x
        self.y = y
    }
}
