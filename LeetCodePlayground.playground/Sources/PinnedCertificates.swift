import Alamofire
import Foundation

public struct ServerTrustPolicy: ServerTrustEvaluating {
    let certificates: [SecCertificate]

    init(certificates: [SecCertificate]) {
        self.certificates = certificates
    }

    public func evaluate(_ trust: SecTrust, forHost host: String) throws {
        let policy = SecPolicyCreateSSL(true, host as CFString)
        SecTrustSetPolicies(trust, policy)

        guard let serverCertificates = SecTrustCopyCertificateChain(trust) as? [SecCertificate], !serverCertificates.isEmpty else {
            throw NSError()
        }

        let pinnedCertificatesData = certificates.compactMap(\.data)

        var trustIsValid = false
        for serverCertificate in serverCertificates {
            <#body#>
        }

        var policyError: CFError?
        if !SecTrustEvaluateWithError(trust, &policyError) {
            throw policyError!
        }
    }
}
