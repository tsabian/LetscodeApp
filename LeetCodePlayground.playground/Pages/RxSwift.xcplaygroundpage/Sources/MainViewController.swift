import RxSwift
import UIKit

public class MainViewController: UIViewController {
    let viewModel: MainViewModelProtocol

    init(viewModel: MainViewModelProtocol = MainViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
    }
}
