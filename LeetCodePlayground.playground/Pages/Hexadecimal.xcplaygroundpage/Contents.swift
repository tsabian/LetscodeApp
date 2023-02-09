//: [Previous](@previous)

import Foundation

// echo -n "text" | xxd -p | sed 's/\(..\)/0x\1 /g'

let data = Data([0x74, 0x65, 0x78, 0x74])
let hexString = data.map { String(format: "%02x", $0) }.joined()
print(hexString)

measurePerformance {
    print(data.stringFromHex)
}.formattedTime

// echo -n "texto muito grande " | xxd -p

let keys = [
    "746578746f206d7569746f206772616e646520"
].joined()

print(keys.convertFromHexString)

