import Foundation
import UIKit

protocol CoordinatorProtocol {
    func start()
}

enum GenericError {
    case generic
    case serviceUnavailable
    case internet
}

protocol BaseCoordinatorProtocol: CoordinatorProtocol {
    var presenter: UINavigationController { get set }

    func showGenericError()
    func showServiceUnavailableError()
    func showNoInternetError()
}

extension BaseCoordinatorProtocol {
    func showGenericError() {
        print(#function)
    }

    func showServiceUnavailableError() {
        print(#function)
    }

    func showNoInternetError() {
        print(#function)
    }

    func start() {
        print(#function)
    }
}

protocol BaseViewModelProtocol: AnyObject {
    associatedtype CoordinatorType

    var coordinator: CoordinatorType? { get set }

    func handleGenericError(_ error: GenericError)
}

extension BaseViewModelProtocol where CoordinatorType: BaseCoordinatorProtocol {
    func handleGenericError(_ error: GenericError) {
        switch error {
        case .generic:
            coordinator?.showGenericError()

        case .serviceUnavailable:
            coordinator?.showServiceUnavailableError()

        case .internet:
            coordinator?.showNoInternetError()
        }
    }
}

protocol MainCoordinatorProtocol: BaseCoordinatorProtocol {}

class MainCoordinator: MainCoordinatorProtocol {
    var presenter: UINavigationController

    init() {
        presenter = UINavigationController()
    }
}

protocol SecoundaryCoordinatorProtocol: BaseCoordinatorProtocol {}

class SecoundaryCoordinator: SecoundaryCoordinatorProtocol {
    var presenter: UINavigationController

    init() {
        presenter = UINavigationController()
    }
}

class SmsViewModel: BaseViewModelProtocol {
    func handleGenericError(_ error: GenericError) {
        print(#function)
    }

    var coordinator: MainCoordinatorProtocol?
}

class EmailViewModel: BaseViewModelProtocol {
    func handleGenericError(_ error: GenericError) {
        print(#function)
    }

    var coordinator: SecoundaryCoordinatorProtocol?
}

let smsViewModel = SmsViewModel()
smsViewModel.handleGenericError(.generic)
smsViewModel.handleGenericError(.internet)

let emailViewModel = EmailViewModel()
emailViewModel.handleGenericError(.generic)
emailViewModel.handleGenericError(.serviceUnavailable)
