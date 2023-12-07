import Foundation

// let now = Date()
// now.toString(format: "HH:mm")

let milleseconds = Double(1000)
let dateDouble = TimeInterval(1_657_230_201_465) / milleseconds
let dateFormatted = Date(timeIntervalSince1970: dateDouble)
print(dateFormatted.toString(withFormat: "dd/MM/yyyy HH:mm:ss", in: "Sao_Paulo/Sao_Paulo"))

print(Date().microsecondsDate())
print(Date().microsecondsDate())
print(Date().microsecondsDate())
print(Date().microsecondsDate())
print(Date().microsecondsDate())
print(Date().microsecondsDate())
print(Date().microsecondsDate())
print(Date().microsecondsDate())
print(Date().microsecondsDate())
print(Date().microsecondsDate())
print(Date().microsecondsDate())
