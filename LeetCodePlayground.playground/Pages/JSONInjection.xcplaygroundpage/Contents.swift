// MARK: - Application

import Foundation
import UIKit

let usernameField = UITextField()
let passwordField = UITextField()
usernameField.text = "Tiago"
passwordField.text = "pass@!123"

struct LoginModel: Codable {
    let username: String
    let password: String
    let role: String
}

let jsonString = "{\"username\": \"\(usernameField.text ?? "")\", \"password\": \"\(passwordField.text ?? "")\", \"role\": \"default\" }"
print("Expected")
print(jsonString)

// MARK: - User JSON Injection

usernameField.text = "Tiago\", \"role\": \"admin"
let jsonInjectionString = "{\"username\": \"\(usernameField.text ?? "")\", \"password\": \"\(passwordField.text ?? "")\", \"role\": \"default\" }"
print("JSON Injection")
print(jsonInjectionString)

// MARK: - Injection Serialization

guard let data = jsonInjectionString.data(using: .utf8) else {
    fatalError("Serialization error")
}

do {
    let jsonData: [String: Any] = try JSONSerialization.jsonObject(with: data) as? [String: Any] ?? [:]
    print(jsonData)
} catch {
    print(error)
}

// MARK: - JSON Serialization Fix

// 1. Não crie atributos JSON cujos nomes sejam derivados da entrada do usuário.
// 2. Certifique-se de que toda a serialização para JSON seja realizada com o uso de uma função de serialização segura que delimite dados não confiáveis entre aspas simples ou duplas e escape quaisquer caracteres especiais.

let login = LoginModel(
    username: usernameField.text ?? "",
    password: passwordField.text ?? "",
    role: "default"
)

do {
    let login = try JSONEncoder().encode(login)
    // test
    let result = try JSONDecoder().decode(LoginModel.self, from: login)
    print(result)
} catch {
    print(error)
}
