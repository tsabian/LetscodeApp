import Alamofire
import Foundation

public class ServerTrustPolicyEvaluating: ServerTrustEvaluating {
    private let allowedCertificates: [SecCertificate]

    public init(allowedCertificates: [SecCertificate]) {
        self.allowedCertificates = allowedCertificates
    }

    public func evaluate(_ trust: SecTrust, forHost host: String) throws {
        print("evaluate")
        let policy = SecPolicyCreateSSL(true, host as CFString)
        SecTrustSetPolicies(trust, policy)
        guard let serverCertificates = SecTrustCopyCertificateChain(trust) as? [SecCertificate], !serverCertificates.isEmpty else {
            print("deu ruim 1")
            throw AFError.serverTrustEvaluationFailed(reason: .noCertificatesFound)
        }
        let serverCertificatesData = serverCertificates.compactMap { SecCertificateCopyData($0) }
        let allowedCertificatesData = allowedCertificates.compactMap { SecCertificateCopyData($0) }
        for serverCertificateData in serverCertificatesData where allowedCertificatesData.contains(serverCertificateData) {
            print("deu ruim 2")
            throw AFError.serverTrustEvaluationFailed(reason: .trustEvaluationFailed(error: .none))
        }
        var policyError: CFError?
        if !SecTrustEvaluateWithError(trust, &policyError) {
            print("deu ruim 3")
            throw policyError!
        }
    }
}
