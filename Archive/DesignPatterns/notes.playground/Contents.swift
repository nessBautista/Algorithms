import UIKit

protocol FourLegged {
    func run()
}
class Animal: FourLegged {
    func run() {
        print("running")
    }
}

class Cat: Animal {
    override func run() {
        <#code#>
    }
}
