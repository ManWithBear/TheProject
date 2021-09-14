import UIKit

public class App {
    public func createUIStack() -> UIViewController {
        let tab = UITabBarController()
        tab.viewControllers = [
            ColorfulViewController(.red),
            ColorfulViewController(.green),
            ColorfulViewController(.blue),
        ]
        return tab
    }
}

class ColorfulViewController: CreatedInCodeViewController {
    let color: UIColor

    init(_ color: UIColor) {
        self.color = color
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
    }
}
