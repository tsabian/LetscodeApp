import Alamofire
import Foundation

// falha =  sni.cloudflaressl.com
// sucesso = *.ibge.gov.br
let fileName = "*.ibge.gov.br"
let dnsK = "ibge.gov.br"
let bundle = Bundle(for: ServerTrustPolicyEvaluating.self)

guard let url = bundle.url(forResource: fileName, withExtension: "cer"), let certData = try? Data(contentsOf: url), let cert = SecCertificateCreateWithData(nil, certData as CFData) else {
    fatalError("Cer file cannot be found")
}

let evaluators = [dnsK: ServerTrustPolicyEvaluating(allowedCertificates: [cert])]
let serverTrustManager = ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: evaluators)
let sessionManager = Session(serverTrustManager: serverTrustManager)

sessionManager.request(IBGENetwork.calendario).validate().response { result in
    if let err = result.error {
        print(err.errorDescription ?? "")
        return
    }

    guard let response = result.response else {
        print("Falhou no request")
        return
    }

    print(response.statusCode)
}
