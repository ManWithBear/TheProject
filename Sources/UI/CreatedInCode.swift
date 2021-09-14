import UIKit

class CreatedInCodeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    @available(*, unavailable, message: "This class can not be used in the Interface Builder")
    required init?(coder: NSCoder) { fatalError("This class can not be used in the Interface Builder") }

    func initialSetup() { }
}

class CreatedInCodeViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable, message: "This class can not be used in the Interface Builder")
    required init?(coder: NSCoder) { fatalError("This class can not be used in the Interface Builder") }
}
