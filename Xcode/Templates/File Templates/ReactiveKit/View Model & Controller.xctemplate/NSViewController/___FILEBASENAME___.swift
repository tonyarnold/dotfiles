// ___FILEHEADER___

import Cocoa
import ReactiveKit

final class ___VARIABLE_viewControllerName:identifier___: ___VARIABLE_viewControllerSubclass___ {

    // MARK: - Properties

    private(set) var viewModel: ___VARIABLE_viewModelName:identifier___? {
        willSet {
            viewModelDisposeBag.dispose()
        }
        didSet {
            viewModelDisposeBag += bind(to: viewModel)
        }
    }

    // MARK: - View Controller Implementatation

    override var representedObject: Any? {
        willSet {
            precondition(newValue is ___VARIABLE_viewModelName:identifier___?)
        }
        didSet {
            self.viewModel = representedObject as? ___VARIABLE_viewModelName:identifier___
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModelDisposeBag.dispose()
        viewModelDisposeBag += bind(to: viewModel)
    }

    // MARK: - Private Implementation

    private var viewModelDisposeBag = DisposeBag()

    private func bind(to viewModel: ___VARIABLE_viewModelName:identifier___?) -> CompositeDisposable {
        let viewModelDisposables = CompositeDisposable()

        if let viewModel = viewModel, isViewLoaded {

        }

        return viewModelDisposables
    }
}
