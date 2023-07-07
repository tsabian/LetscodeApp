import Foundation
import UIKit

let usernameField = UITextField()
let passwordField = UITextField()
usernameField.text = "tiago"
passwordField.text = "pass@!123"

struct LoginModel: Codable {
    let username: String
    let password: String
    let role: String
}

let resultFromAPI: NSDictionary = [
    "username": usernameField.text,
    "password": passwordField.text,
    "role": "default",
]

guard JSONSerialization.isValidJSONObject(resultFromAPI),
      let jsonData = try? JSONSerialization.data(withJSONObject: resultFromAPI)
else {
    fatalError("Invalid Json")
}

print(jsonData.base64EncodedString())

guard let data = Data(base64Encoded: jsonData.base64EncodedString()) else {
    fatalError("JSON encoded failure")
}

do {
    let login = try JSONDecoder().decode(LoginModel.self, from: data)
    print(login.username)
    print(login.password)
    print(login.role)
} catch {
    print(error)
}
