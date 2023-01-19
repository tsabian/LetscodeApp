import Foundation

// let now = Date()
// now.toString(format: "HH:mm")

let milleseconds = Double(1000)
let dateDouble = TimeInterval(1657230201465) / milleseconds
let dateFormatted = Date(timeIntervalSince1970: dateDouble)
print(dateFormatted.toString(withFormat: "dd/MM/yyyy HH:mm:ss", in: "Sao_Paulo/Sao_Paulo"))
