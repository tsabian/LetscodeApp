import Foundation

protocol AppReviewDelegate: AnyObject {
    func avaliouoApp(flag: Bool)
}

class AppReviewManagement {
    weak var delegate: AppReviewDelegate?

    func shouldShowInAppReview() {
        print("Abre o dialog")
    }

    func dialogSim() {
        // Executa o bloco do avaliar sim
        print("Quer avaliar")
        delegate?.avaliouoApp(flag: true)
    }

    func dialogNao() {
        print("Não quer avaliar")
        delegate?.avaliouoApp(flag: false)
    }
}

class ViewModel: AppReviewDelegate {
    let appReview: AppReviewManagement

    init() {
        appReview = AppReviewManagement()
        appReview.delegate = self
    }

    func startReviewFlow() {
        print("mini app chamou a funcao startReviewFlow")
        appReview.shouldShowInAppReview()
    }

    func simularOSim() {
        appReview.dialogSim()
    }

    func simularONao() {
        appReview.dialogNao()
    }

    func onReviewAccepted(data: Bool) {
        print("Responder para o mini app \(data)")
    }

    func avaliouoApp(flag: Bool) {
        onReviewAccepted(data: flag)
    }
}

let viewModel = ViewModel()
viewModel.startReviewFlow()
// viewModel.simularONao()
