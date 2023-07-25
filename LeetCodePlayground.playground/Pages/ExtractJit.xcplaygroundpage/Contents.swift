//: [Previous](@previous)

import Foundation

struct JwtDecodedModel: Codable {
    let jti: String
}

let jwtOkString = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJqdGkiOiJ0ZXN0ZSJ9.NnkLJbeVXeGa-X2U6K2B9wkLRhmyG_a3uxbEQut3VKY"
let jwtFailString = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"

var arrayJWT = jwtFailString.components(separatedBy: ".")
if arrayJWT.count < 2 {
    print("menor que dois")
} else {
    let payload = arrayJWT[1]
    var data: Data!

    if let dataFirstTry = Data(base64Encoded: payload, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) {
        data = dataFirstTry
    } else if let dataSecondTry = Data(base64Encoded: "\(payload)=", options: Data.Base64DecodingOptions.ignoreUnknownCharacters) {
        data = dataSecondTry
    } else if let dataThirdTry = Data(base64Encoded: "\(payload)==", options: Data.Base64DecodingOptions.ignoreUnknownCharacters) {
        data = dataThirdTry
    } else {
        print("nenhum data")
    }

    do {
        let decoded = try JSONDecoder().decode(JwtDecodedModel.self, from: data)
        // test
        print(decoded)
    } catch {
        print(error)
    }
}
