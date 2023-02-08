import Alamofire

public struct ServerTrustPolicy: ServerTrustEvaluating {
//    let certificates = [SecCertificate]()
//
//    init(certificates: [SecCertificate]) {
//        self.certificates = certificates
//    }
//
//    public func evaluate(_ trust: SecTrust, forHost host: String) throws {
//        let policy = SecPolicyCreateBasicX509()
//        SecTrustSetPolicies(trust, policy)
//        for certificate in certificates {
//            SecTrustSetAnchorCertificates(trust, [certificate] as CFArray)
//            var trustResult = SecTrustResultType.unspecified
//            if SecTrustEvaluateWithError(trust, trustResult) {
//                switch trustResult {
//                case .proceed, .unspecified:
//                    return
//                default:
//                    break
//                }
//            }
//        }
//        throw AFError.serverTrustEvaluationFailed(reason: .customEvaluationFailed(error: ))
//    }
}
