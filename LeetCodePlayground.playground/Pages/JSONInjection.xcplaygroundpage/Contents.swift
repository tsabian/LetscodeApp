// O método grava uma entrada não validada no JSON. Essa chamada pode permitir que um invasor injete elementos ou atributos arbitrários na entidade JSON.

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

// Como a serialização JSON é realizada usando interpolação, os dados não confiáveis em usernameField e passwordField não serão validados para realizar escape dos caracteres especiais relacionados a JSON. Isso permite que um usuário insira chaves JSON arbitrariamente, possivelmente mudando a estrutura do JSON serializado.

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
    // test
    print("Serialization result")
    let result = try JSONSerialization.data(withJSONObject: jsonData)
    print(String(data: result, encoding: .utf8))
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
    print("Codable result")
    let result = try JSONDecoder().decode(LoginModel.self, from: login)
    print(result)
} catch {
    print(error)
}
