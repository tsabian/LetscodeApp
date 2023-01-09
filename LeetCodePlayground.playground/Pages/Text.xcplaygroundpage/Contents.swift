//: [Previous](@previous)

import Foundation

let name = "usuario: %@"
print(name.format("TIAGO"))

let document = "1234567801"
debugPrint(document.suffix(4))

func miniAppNameForAnalytics(miniAppName: String) -> String {
    let name = miniAppName.trimmingCharacters(in: CharacterSet(charactersIn: " ")).replacingOccurrences(of: " ", with: "_").lowercased()
    let screenName = "/\(name)/avalie_bitz"
    return screenName
}

print(miniAppNameForAnalytics(miniAppName: " Recarga de celular "))

let emails = [
    "tsabian@hotmail.com",
    "zigmazineutrons@gmail.com",
    "tiago.oliveira@emamil.com",
    "tiagoo@ciandt.com",
    "testeemail.com",
    "",
    "1@teste.com"
]

for i in 0..<emails.count {
    print()
    print("\(emails[i]) - \(emails[i].obfuscateEmail(obfuscateDns: false)) - \(emails[i].obfuscateEmail())")
}
